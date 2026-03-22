%% Loading Human-GEM into MATLAB

% All the model file formats described below are on the main branch of the 
% Human-GEM repository. Note that only the .yml version is available on 
% branches other than main (e.g., devel), to facilitate tracking of model 
% changes.

% The quickest and easiest way to load the Human-GEM model is from the 
% .mat file.
load('Human-GEM.mat');

% This will load the model as a structure named ihuman.
ihuman

% Flux Balance Analysis
% One of the most common analysis methods for GEMs is flux balance 
% analysis (FBA). This page will briefly walk through the basics of using 
% FBA with Human-GEM.

% You must have a linear optimization solver (e.g., Gurobi) installed and 
% accessible by MATLAB to run FBA. See the installation page of this guide 
% or the RAVEN instructions for details on setting up a solver.

% Optimization objective
% By default, the model objective (defined by the .c model field) is set 
% to maximize flux through the generic human biomass reaction (MAR13082), 
% and all exchange reactions are open.
ihuman.rxns(ihuman.c == 1)

% Run FBA using the RAVEN solveLP function.

% The sol.f field contains the (negative) value of the objective, and the 
% sol.x vector contains the flux value for each reaction.

% As mentioned, all the exchange reactions are fully opened (upper and 
% lower bounds set to 1000 and -1000, respectively). Therefore, the value 
% of the biomass flux here is meaningless (except that it is nonzero), 
% and its units are undefined. Additional constraints, such as those 
% defining the flux bounds of exchange reactions, are necessary to define 
% a feasible solution space.
sol = solveLP(ihuman)

% An FBA example
% Calculation of ATP yield 
% To illustrate an example of a more meaningful flux solution, we can use 
% FBA to calculate ATP yield (more specifically, the amount of ADP 
% phosphorylated) per glucose consumed.

% ATP yield can be quantified by the amount of flux through the ATP 
% hydrolysis reaction MAR03964.
constructEquations(ihuman, 'MAR03964')

% Change the objective to maximize flux through the ATP hydrolysis reaction
ihuman = setParam(ihuman, 'obj', 'MAR03964', 1);

% Prevent import of all metabolites except glucose, for which the max 
% import flux is set to 1 (mmol/gDW/h):
ihuman = setExchangeBounds(ihuman, 'glucose', -1); 

% Now perform FBA to determine the maximum amount of ATP hydrolyzed 
% (ADP phosphorylated) per equivalent of glucose consumed.
sol = solveLP(ihuman)

% As expected, the theoretical mol ADP phosphorylated per mol glucose 
% consumed is 2. Note that we have not allowed the import of oxygen, 
% so this is under anaerobic conditions. This is of course purely 
% theoretical given that most humans produce very little of anything when 
% deprived of oxygen.
ihuman = setExchangeBounds(ihuman, {'glucose', 'O2'}, [-1, -1000]);

% Note that we are allowing effectively infinite oxygen consumption, since 
% we are interested in non-O2-limited ATP yield per glucose. Now re-run 
% the FBA to see how the maximum yield has changed:
sol = solveLP(ihuman)

%% GEM Extraction
% Human-GEM is a generic model of human metabolism, meaning that it 
% contains metabolic reactions known to occur in any human cell. The model 
% is therefore not representative of any one tissue or cell type, in which 
% only a subset of the reactions would be active.

% A common approach is to extract the subset of the GEM that is likely to 
% be active in the tissue or cell type of interest, based on a 
% corresponding dataset (e.g., transcriptomics, proteomics, metabolomics, 
% etc.). This approach is often referred to as GEM extraction or
% contextualization, where the generated model is termed the extracted or 
% contextualized/context-specific GEM.

% Fast Task©\driven Integrative Network Inference for Tissues (ftINIT)

% The ftINIT algorithm is available in the RAVEN Toolbox, and we use it 
% together with help functions for Human-GEM available in the Human-GEM 
% repository.

% The reference GEM from which the tissue-specific models will be extracted 
% is Human-GEM. Load the model from the Human-GEM.mat file in the 
% Human-GEM repository
load('Human-GEM.mat'); 

% The second flag indicates if the model should be converted to gene symbols 
% from ENSEMBL. This has to be decided at this point.
% Replace path/to/HumanGEM with your local path to the Human-GEM repo root.
% For use with animal models derived from Human-GEM, such as Mouse-GEM, 
% both the model and paths needs to be replaced. Also, 
% the convert genes flag may be irrelevant depending on the if ENSEMBL 
% genes are used in that model.
prepData = prepHumanModelForftINIT(ihuman, false, 'path/to/HumanGEM/data/metabolicTasks/metabolicTasks_Essential.txt', 'path/to/HumanGEM/model/reactions.tsv');
% save('prepData.mat', 'prepData')

% load('./models/Human_GEM_prepData.mat')

% load gene expression data
% replace 'my/path/' with the path on your system, or change to the directory containing the file
load('./Data/data_struct.mat')

% Although the original tINIT implementation always compared gene 
% expression in the tissue of interest to the average of all other provided 
% tissues, ftINIT enables the option to instead compare the expression to 
% a threshold value. Here, we will use this alternative approach with a 
% threshold value of 1 TPM.
data_struct.threshold = 1;

% Take a look at data_struct to make sure all the fields are present and 
% have the expected dimensions
data_struct

% Run ftINIT
% Now all inputs are ready to run ftINIT and extract GEMs specific to the 
% samples based on their corresponding RNA expression profile. ftINIT 
% normally runs in two steps, of which the second is optional. The first 
% step excludes most of the reactions without gene rules (GPRs) from the 
% problem, and the second step determines which of those reactions should 
% be removed. The second step can be omitted, which causes most reactions 
% without GPRs to remain in the model. This is a good option in many cases, 
% for example for structural comparison of models, since removal of 
% reactions without GPRs does not provide any additional information and 
% may add randomness in cases where there are several equally good solutions.
model1 = ftINIT(prepData, data_struct.tissues{1}, [], [], data_struct, {}, getHumanGEMINITSteps('1+1'), false, true);
model1.id = data_struct.tissues{1};


% Run ftINIT for all samples
% We can now run ftINIT on all samples:
numSamp = length(data_struct.tissues);
models = cell(numSamp, 1);
for i = 1:numSamp
    disp(['Model: ' num2str(i) ' of ' num2str(numSamp)])
    models{i} = ftINIT(prepData, data_struct.tissues{i}, [], [], data_struct, {}, getHumanGEMINITSteps('1+1'), false, true);
end

% save('models.mat', 'models')

baseModel = prepData.refModel;
% now build a matrix saying which reactions are on
compMat = false(length(baseModel.rxns), length(models));

for i = 1:size(compMat,2)
    compMat(:,i) = ismember(baseModel.rxns,models{i}.rxns);
end

% run t-sne
rng(1);  %set random seed to make reproducible
proj_coords = tsne(double(compMat.'), 'Distance', 'hamming', 'NumDimensions', 2, 'Exaggeration', 6, 'Perplexity', 10);

% export to R
d = struct();
d.tsneX = proj_coords(:, 1);
d.tsneY = proj_coords(:, 2);
save('TSNE.mat', 'd');

% We can then visualize the data in R using
% 'Version_context_specific_models.R'

%% Structural and functional comparison of GEMs
model_ids = data_struct.tissues;

for i=1:length(models)
    model = models{i,1};
    model.id = model_ids{i,1};
    models{i,1} = model;
end

% The RAVEN compareMultipleModels function can be used to compare some 
% basic features of different models such as reaction content and 
% subsystem coverage.
res = compareMultipleModels(models);

% Take a look at the contents of the results structure res.
res

% The compareMultipleModels function represents the reaction content of 
% each GEM as a binary vector (missing reactions are 0, present reactions 
% are 1) to enable the use of quantitative comparison metrics, such as 
% Hamming distance. GEMs that share fewer reactions will be separated by a 
% larger Hamming distance, whereas GEMs that contain many of the same 
% reactions will exhibit a small Hamming distance.

% Visualize the reaction content Hamming similarity (1 - Hamming distance) 
% among the GEMs using a clustergram.
clustergram(res.structComp, 'Symmetric', false, 'Colormap', 'bone', 'RowLabels', res.modelIDs, 'ColumnLabels', res.modelIDs);

% The structCompMap field of the model comparison results structure 
% contains a mapping of the GEMs' binary reaction vectors in reduced (3) 
% dimensions using tSNE. Since 3D plots can be difficult to interpret, we 
% can regenerate the mapping in 2 dimensions.
rxn2Dmap = tsne(res.reactions.matrix', 'Distance', 'hamming', 'NumDimensions', 2, 'Perplexity', 5);

% plot and label the GEMs in tSNE space
scatter(rxn2Dmap(:,1), rxn2Dmap(:,2));
hold on
text(rxn2Dmap(:,1), rxn2Dmap(:,2), res.modelIDs);

% The Hamming distance heatmap and tSNE projection give an overall picture 
% of how similar or different models are from one another, but it does not 
% resolve the cause or biological meaning of those differences. 
% A convenient source of biological context is the subSystems field in the 
% model, which describes the metabolic subsystem or pathway to which 
% reactions belong. We can therefore look at differences in reaction 
% content in each of these subsystems to see which parts of metabolism 
% differ most among the GEMs.
useModels = {'adipose tissue', 'blood', 'kidney', 'liver', 'muscle'};
keep = ismember(res.modelIDs, useModels);
subMat = res.subsystems.matrix(:, keep);
subCoverage = (subMat - mean(subMat, 2)) ./ mean(subMat, 2) * 100;

% select subsystems to include in plot
inclSub = any(abs(subCoverage) > 25, 2);
subNames = res.subsystems.ID(inclSub);

% generate clustergram
cg = clustergram(subCoverage(inclSub,:), 'Colormap', redbluecmap, 'DisplayRange', 100, 'rowLabels', subNames, 'columnLabels', useModels, 'ShowDendrogram', 'OFF');

% Compare GEM functions
% In addition to GEM structure, the functionality of GEMs can be compared 
% to provide insight into differences in their metabolic activity. One way 
% in which the function of a GEM can be assessed is by evaluating its 
% ability to perform different metabolic tasks.

% The GTEx tissue GEMs used in this example were generated using tINIT with 
% a list of 57 essential tasks (see the GEM extraction section of this 
% guide for details). Therefore, comparing the GEMs' ability to complete 
% these 57 tasks would be highly uninteresting because they were all 
% generated with the requirement that these tasks are functional. For a 
% more interesting comparison, we will instead use a different list of 
% 256 metabolic tasks.

% To speed up the calculation and to narrow the focus, we will include only 
% a few of the GEMs in this comparison.
useModels = {'adipose tissue', 'blood', 'kidney', 'liver', 'muscle'};
keep = ismember(res.modelIDs, useModels);

% replace '/my/path/' with the actual path on your machine
taskFileName = './Data/metabolicTasks_Full.txt';
taskFile = parseTaskList(taskFileName);

res_func = compareMultipleModels(models(keep), false, false, [], true, taskFileName);

% The results structure will now have an additional funcComp field.
res_func.funcComp

% The matrix subfield is a binary matrix indicating whether each task 
% passed (1) or failed (0) in each GEM, and the tasks subfield contains the 
% name of the evaluated tasks.
% Identify which tasks differed among the GEMs (i.e., not all passed or 
% all failed).
isDiff = ~all(res_func.funcComp.matrix == 0, 2) & ~all(res_func.funcComp.matrix == 1, 2);
diffTasks = res_func.funcComp.tasks(isDiff)

% visualize the matrix
spy(res_func.funcComp.matrix(isDiff,:), 30);

% apply some formatting changes
set(gca, 'XTick', 1:numel(useModels), 'XTickLabel', useModels, 'XTickLabelRotation', 90, ...
    'YTick', 1:numel(diffTasks), 'YTickLabel', diffTasks, 'YAxisLocation', 'right');
xlabel(gca, '');

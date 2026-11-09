# 软件安装指南（中英双语）

# Software Installation Guide (Bilingual)

> **适用课程 / Course**：系统生物学实验课 / Systems Biology Laboratory
>
> **说明 / Note**：本指南以 Windows 系统为例，其他系统请参考文中提示。
> This guide uses Windows as the example; for other operating systems, follow the hints given in each section.

---

## 目录 / Contents

1. [MATLAB 安装 / MATLAB Installation](#一matlab-安装--i-matlab-installation)
2. [R 安装 / R Installation](#二r-安装--ii-r-installation)
3. [Gurobi 求解器安装 / Gurobi Solver Installation](#三gurobi-求解器安装--iii-gurobi-solver-installation)
4. [环境准备 / Environment Setup](#四环境准备--iv-environment-setup)

---

## 一、MATLAB 安装 / I. MATLAB Installation

### 1. 软件下载 / Download

（1）下载网址：[专业软件 - 清华大学信息化用户服务平台](https://its.tsinghua.edu.cn/ggrj.jsp?urltype=tree.TreeTempUrl&wbtreeid=1083)
（1）Download page: [Professional Software – Tsinghua University IT Service Platform](https://its.tsinghua.edu.cn/ggrj.jsp?urltype=tree.TreeTempUrl&wbtreeid=1083)

（2）选择“计算类”。
（2）Select “Computing (计算类)”.

（3）选择“Matlab”。
（3）Select “MATLAB”.

（4）选择适配你的电脑的 Matlab 版本。
（4）Choose the MATLAB version that matches your computer.

### 2. 安装 / Installation

（1）打开 MATLAB 软件安装程序 ISO 文件，运行 setup 进行安装。
（1）Open the MATLAB installer ISO file and run `setup` to start the installation.

（2）点击“高级选项”→“我有文件安装密钥”。
（2）Click “Advanced Options” → “I have a File Installation Key”.

（3）选择“是否接受许可协议条款”为“是”后，点击“下一步”。
（3）Set “Do you accept the terms of the license agreement?” to “Yes”, then click “Next”.

（4）在“输入文件安装密钥”处输入 MATLAB 指定版本的安装密钥。
（4）Enter the installation key for the specified MATLAB version in the “File Installation Key” field.

> **注**：此密钥可在 its.tsinghua.edu.cn 网站 **首页 > 公共软件 > 计算类 > MATLAB > “MATLAB安装手册及相关文件”** 中获得（文件名：`sn.txt`）。
>
> **Note**: The key is available at its.tsinghua.edu.cn under **Home > Public Software > Computing > MATLAB > “MATLAB Installation Manual and Related Files”** (file name: `sn.txt`).

（5）点击“浏览”按钮，找到许可证文件 `network.lic` 所在的路径。
（5）Click “Browse” and locate the folder containing the license file `network.lic`.

> **注**：获取此许可证文件请登录 its.tsinghua.edu.cn 网站 **首页 > 公共软件 > 计算类 > MATLAB > “MATLAB安装手册及相关文件”** 中下载；`network.lic` 文件包含在该压缩包中。
>
> **Note**: To obtain this license file, log in to its.tsinghua.edu.cn and download it from **Home > Public Software > Computing > MATLAB > “MATLAB Installation Manual and Related Files”**; `network.lic` is included in that archive.

（6）选择 MATLAB 的安装目标文件夹。
（6）Choose the destination folder for the MATLAB installation.

（7）根据自己的使用需求选择需要安装的产品，点击“下一步”。
（7）Select the products you need for your own use, then click “Next”.

（8）如需创建桌面快捷方式，请勾选“将快捷方式添加到桌面”，点击“下一步”。
（8）If you want a desktop shortcut, check “Add a shortcut to the desktop”, then click “Next”.

（9）确认安装 MATLAB 的相关信息，点击“开始安装”。
（9）Confirm the installation information and click “Start Installation”.

（10）根据所选产品的不同，安装文件所需容量会不同，请预留足够的磁盘存储空间。
（10）The required disk space depends on the products you select, so make sure you have enough free disk space.

（11）提示安装完毕后，点击“关闭”按钮，完成 MATLAB 2022b 的安装。
（11）When the installation is complete, click “Close” to finish installing MATLAB 2022b.

---

## 二、R 安装 / II. R Installation

### 1. 软件下载 / Download

#### 1.1 下载 R 和 Rtools / Download R and Rtools

（1）下载网址：[R: The R Project for Statistical Computing](https://www.r-project.org/)
（1）Download page: [R: The R Project for Statistical Computing](https://www.r-project.org/)

（2）点击“download R”。
（2）Click “download R”.

（3）找到“China”，可以随意选择一个镜像网址，一般选择第一个。
（3）Find “China” and choose any mirror site; usually the first one is fine.

（4）点击“Download R for Windows”。
（4）Click “Download R for Windows”.

（5）首先下载 R，点击“base”。
（5）Download R first: click “base”.

（6）可以直接点击“Download R-4.5.0 for Windows”下载最新版本，也可点击“Previous releases”下载其他版本。
（6）You can click “Download R-4.5.0 for Windows” to get the latest version, or click “Previous releases” to get an older version.

（7）再次回到该页面下载 Rtools，点击“Rtools”。
（7）Return to the same page to download Rtools: click “Rtools”.

（8）根据所下载的 R 版本选择对应的 Rtools 下载。
（8）Download the Rtools version that matches the R version you downloaded.

#### 1.2 下载 RStudio / Download RStudio

（1）下载网址：[RStudio Desktop - Posit](https://posit.co/download/rstudio-desktop/)
（1）Download page: [RStudio Desktop – Posit](https://posit.co/download/rstudio-desktop/)

（2）点击“DOWNLOAD RSTUDIO DESKTOP FOR WINDOWS”。
（2）Click “DOWNLOAD RSTUDIO DESKTOP FOR WINDOWS”.

（3）页面下方提供其他系统版本。
（3）Other system versions are listed further down the page.

（4）下载完成后的三个文件（以 4.5 为例）为：`R-4.5.0-win.exe`、`rtools45-6768-6492.exe`、`RStudio-2026.01.1-403.exe`。
（4）You should end up with three files (example for R 4.5): `R-4.5.0-win.exe`, `rtools45-6768-6492.exe`, and `RStudio-2026.01.1-403.exe`.

### 2. 安装 / Installation

#### 2.1 安装 R / Installing R

（1）双击下载好的“R-4.5.0-win”。
（1）Double-click the downloaded file `R-4.5.0-win`.

（2）点击“确定”。
（2）Click “OK”.

（3）点击“下一步”。
（3）Click “Next”.

（4）修改安装位置。
（4）Change the installation location.

（5）修改安装文件夹后，点击“下一步”。
（5）After changing the installation folder, click “Next”.

（6）可以去掉不需要的组件，点击“下一步”。
（6）You may deselect components you do not need, then click “Next”.

（7）安装向导—启动选项：点击“下一步”。
（7）Setup wizard – Start menu options: click “Next”.

（8）安装向导—选择开始菜单文件夹：点击“下一步”。
（8）Setup wizard – Select Start Menu folder: click “Next”.

（9）安装向导—选择附加任务：点击“下一步”。
（9）Setup wizard – Select additional tasks: click “Next”.

（10）安装完成，点击“结束”。
（10）When installation finishes, click “Finish”.

#### 2.2 安装 Rtools / Installing Rtools

（1）双击“rtools”。
（1）Double-click the `rtools` installer.

（2）修改安装位置，点击“next”。
（2）Change the installation location, then click “Next”.

（3）选择额外任务，点击“next”。
（3）Select additional tasks, then click “Next”.

（4）点击“install”。
（4）Click “Install”.

（5）点击“Finish”结束。
（5）Click “Finish” to complete.

#### 2.3 安装 RStudio / Installing RStudio

（1）双击下载的文件“RStudio-”。
（1）Double-click the downloaded file starting with `RStudio-`.

（2）点击“下一步”。
（2）Click “Next”.

（3）更改安装目录，点击“安装”。
（3）Change the installation directory, then click “Install”.

（4）安装完成，点击“完成”。
（4）When installation finishes, click “Finish”.

### 3. 运行 RStudio / Launching RStudio

（1）双击打开，或在搜索栏搜索 R 打开。
（1）Double-click it to open, or search for “R” in the search bar.

（2）根据电脑信息选择合适的 version，点击“OK”。
（2）Select the appropriate version for your computer, then click “OK”.

（3）等待界面启动。
（3）Wait for the interface to load.

> **详细参考 / Detailed reference**：[(53 封私信 / 80 条消息) R 语言的下载和安装（详细版）- 知乎](https://zhuanlan.zhihu.com/p/1911894445693055367)
> [(53 messages) Downloading and Installing R (Detailed Version) – Zhihu](https://zhuanlan.zhihu.com/p/1911894445693055367)

---

## 三、Gurobi 求解器安装 / III. Gurobi Solver Installation

### 1. 安装 Gurobi / Installing Gurobi

（1）双击 `Gurobi-10.0.1-win64.msi`，然后点击“Next”和“Accept”等按键。
（1）Double-click `Gurobi-10.0.1-win64.msi`, then click buttons such as “Next” and “Accept”.

（2）选择安装目录，注意安装目录不能出现中文和空格，最好直接使用默认目录。
（2）Choose the installation directory. Note that the path must not contain Chinese characters or spaces; it is best to use the default directory directly.

（3）依次点击“Next”、“Install”、“Finish”。最后的提示是否重启电脑选择“否”。
（3）Click “Next”, “Install”, and “Finish” in sequence. When prompted whether to restart the computer at the end, select “No”.

### 2. 激活 Gurobi / Activating Gurobi

（1）右键以管理员身份运行 `GurobiLicGen.exe`。
（1）Right-click `GurobiLicGen.exe` and select “Run as administrator”.

（2）如果弹出“Windows 已保护你的电脑”的提示窗口，可以点击“更多信息”，再选择“仍要运行”。
（2）If a “Windows protected your PC” pop-up appears, click “More info” and then select “Run anyway”.

（3）出现 `File Generated - Enjoy!!! Press Enter to exit...` 显示，则提示激活成功。
（3）When `File Generated - Enjoy!!! Press Enter to exit...` is displayed, the activation is successful.

（4）激活后生成的证书在 `[gurobi 安装位置]\win64\bin\gurobi.lic`，如 `C:\gurobi1001\win64\bin\gurobi.lic`。
（4）The license file generated after activation is located at `[Gurobi installation directory]\win64\bin\gurobi.lic`, for example, `C:\gurobi1001\win64\bin\gurobi.lic`.

---

## 四、环境准备 / IV. Environment Setup

（1）解压 `Package` 中的三个工具包。
（1）Extract the three toolboxes in `Package`.

（2）打开 MATLAB，在“主页”选项卡中选择“设置路径”（Set Path），点击“添加并包含子文件夹”（Add with Subfolders），选择三个工具包的解压路径即可。
（2）Open MATLAB, select “Set Path” in the “Home” tab, click “Add with Subfolders”, and select the extracted folders of the three toolboxes.

（3）此外，将 Gurobi 安装目录也使用相同的方法添加到 MATLAB 路径中。
（3）In addition, add the Gurobi installation directory to the MATLAB path using the same method.

---

## 附：安装检查 / Appendix: Post-installation Check

安装完成后，可用以下方式快速确认环境是否正常。
After installation, quickly verify that the environment works with the following checks.

| 软件 / Software | 检查方法 / How to check | 期望结果 / Expected |
|---|---|---|
| MATLAB | 启动 MATLAB，在命令行输入 `ver` / Start MATLAB and type `ver` | 列出已安装工具箱 / Lists installed toolboxes |
| R / RStudio | 在控制台输入 `R.version.string` / Type `R.version.string` in the console | 显示 R 版本信息 / Shows the R version |
| Rtools | 输入 `pkgbuild::has_build_tools(debug = TRUE)` / Type `pkgbuild::has_build_tools(debug = TRUE)` | 返回 `TRUE` |
| Gurobi | 在 `win64/bin` 目录下运行 `gurobi_cl --version` / Run `gurobi_cl --version` in `win64/bin` | 显示版本号 / Shows the version |

---

*文档版本 / Version：v1.1　最后更新 / Last updated：2026-11-09*
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

### 1. 软件申请 / License Application

（1）学术许可申请指南：[许可申请 - 刃之砺信息科技](http://www.edgestone-it.com//NewsView1.Asp?id=4)
（1）Academic license application guide: [License Application – Edgestone IT](http://www.edgestone-it.com//NewsView1.Asp?id=4)

（2）下载并填写申请表。
（2）Download and complete the application form.

（3）准备教育部《学籍在线验证报告》。
（3）Prepare the “Online Verification Report of Student Record” issued by the Ministry of Education.

（4）将申请表和学籍在线报告通过邮件发送至 help@edgestone-it.com。
（4）Email the application form and the verification report to help@edgestone-it.com.

> **注**：材料审批一般需要 1–3 个工作日，收到的回复中包含激活码，有效期为一周，请注意及时安装 Gurobi。
>
> **Note**: Review usually takes 1–3 working days. The reply contains an activation code valid for one week, so please install Gurobi promptly.

### 2. 软件下载 / Download

（1）下载链接：[The Leader in Decision Intelligence Technology - Gurobi Optimization](https://www.gurobi.com/)
（1）Download page: [The Leader in Decision Intelligence Technology – Gurobi Optimization](https://www.gurobi.com/)

（2）选择网站上方的“Downloads & Licenses”，点击“Download Center”。
（2）Choose “Downloads & Licenses” in the top navigation, then click “Download Center”.

（3）在“Download the Latest Version of Gurobi”中点击“Gurobi Optimizer”。
（3）Under “Download the Latest Version of Gurobi”, click “Gurobi Optimizer”.

（4）根据自己的电脑选择合适的版本。
（4）Choose the version that matches your computer.

### 3. 安装与激活 / Installation and Activation

（1）双击下载好的安装程序，之后一直点击“Next”即可。
（1）Double-click the downloaded installer and keep clicking “Next”.

（2）安装完成后，在计算机联网的情况下，输入 `cmd` 打开命令提示符窗口，使用 `cd` 命令进入 Gurobi 安装目录下的 `win64/bin` 目录，然后输入邮件中收到的激活码。
（2）After installation, with the computer connected to the internet, open the Command Prompt (`cmd`) and use the `cd` command to enter the `win64/bin` folder of the Gurobi installation directory, then enter the activation code you received by email.

（3）运行激活码后会生成许可文件 `gurobi.lic`，请按操作系统将其存放在以下目录：
（3）Running the activation code produces the license file `gurobi.lic`. Place it in the following location for your operating system:

| 操作系统 / OS | 存放位置 / License location |
|---|---|
| Windows | 把 `gurobi.lic` 放在 `c:\gurobi` 目录下 / Put `gurobi.lic` in `c:\gurobi` |
| Linux | 把 `gurobi.lic` 放在 `/opt/gurobi` 目录下 / Put `gurobi.lic` in `/opt/gurobi` |
| macOS | 把 `gurobi.lic` 放在 `/Library/gurobi` 目录下 / Put `gurobi.lic` in `/Library/gurobi` |

如果没有这些目录，请自行创建。这是 Gurobi 默认的搜索位置。
If the folder does not exist, create it. This is Gurobi's default search location.

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

*文档版本 / Version：v1.0　最后更新 / Last updated：2026-11-07*
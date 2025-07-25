#import "../lib.typ": documentclass

// 你首先应该安装 fonts下的所有字体，或在编译的时候指定字体路径：
// typst watch template/thesis.typ --font-path ./fonts
// 如果是 Web App 上编辑，你应该手动上传所有字体文件，否则部分字体不能正常使用，导致显示错误。
#let (
  // 布局函数
  twoside,
  doc,
  preface,
  mainmatter,
  appendix,
  // 页面函数
  fonts-display-page,
  cover,
  decl-page,
  abstract,
  abstract-en,
  bilingual-bibliography,
  outline-page,
  list-of-figures,
  list-of-tables,
  notation,
  acknowledgement,
  backmatter,
) = documentclass(
  doctype: "doctor", // "bachelor" | "master" | "doctor" | "postdoc", 文档类型，默认为博士生 doctor
  degree: "academic", // "academic" | "professional", 学位类型，默认为学术型 academic
  anonymous: false, // 盲审模式
  twoside: true, // 双面模式，会加入空白页，便于打印
  fontset: "mac", // 选择预定义的字体组："windows" | "mac" | "fandol" | "adobe"
  // fonts参数可用于覆盖或补充fontset中的字体设置
  // 例如：仅想更改某一种字体时，可以这样设置
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),
  // 或者需要自定义特定字体以解决警告和兼容性问题时
  // fonts: (黑体: (name: "Times New Roman", covers: "latin-in-cjk"), "SimHei")),
  info: (
    title: ("基于 Typst 的", "中国科学院大学学位论文"),
    title-en: "Thesis/Dissertation of UCAS Based on Typst",
    supervisors: ("李四 教授", "王五 研究员"),
    supervisors-en: ("Professor Si Li", "Professor Wu Wang"),
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "Zhang San",
    department: "中国科学院xxxx研究所",
    department-en: "Institutes of Science and Development",
    major: "管理科学与工程",
    major-en: "Management Science and Engineering",
    category: "管理学博士",
    category-en: "Management Science",
    supervisor: ("李四", "教授"),
    // supervisor-ii: ("王五", "副教授"),
    // supervisor-ii-en: "Professor My Supervisor",
    submit-date: datetime.today(),
  ),
  // 参考文献源
  bibliography: bibliography.with("ref.bib"),
)

// 文稿设置
#show: doc

// 字体展示测试页
#fonts-display-page()

// 封面页
#cover()

// 声明页
#decl-page()

// 前言
#show: preface

// 中文摘要
#abstract(keywords: ("中国科学院大学", "学位论文", "模板"))[
  中文摘要、英文摘要、目录、论文正文、参考文献、附录、致谢、攻读学位期间 发表的学术论文与其他相关学术成果等均须由另页右页（奇数页）开始。
]

// 英文摘要
#abstract-en(keywords: (
  "University of Chinese Academy of Sciences",
  "Thesis",
  "Typst Template",
))[
  Chinese abstracts, English abstracts, table of contents, the main contents, references, appendix, acknowledgments,
  author's resume and academic papers published during the degree study and other relevant academic achievements must
  start with another right page (odd-numbered page).
]

// 目录
#outline-page()

// 图目录
#list-of-figures()

// 表目录
#list-of-tables()

// 符号列表
#notation(
  title: "符号列表",
)[

  字符

  #table(
    columns: (1fr, auto, auto),
    align: (left, left, left),
    stroke: none,
    // 表格内容与左边距的距离为 0，使其与正文完全左对齐
    inset: (left: 0pt),
    table.header()[*Symbol*][*Description*][*Unit*],
    [$R$], [the gas constant], [$m^2 dot s^(-2) dot K^(-1)$],
    [$C_v$],
    [specific heat capacity at constant volume],
    [$m^2 dot s^(-2) dot K^(-1)$],

    [$C_p$],
    [specific heat capacity at constant pressure],
    [$m^2 dot s^(-2) dot K^(-1)$],

    [$E$], [specific total energy], [$m^2 dot s^(-2)$],
    [$e$], [specific internal energy], [$m^2 dot s^(-2)$],
    [$h_T$], [specific total enthalpy], [$m^2 dot s^(-2)$],
    [$h$], [specific enthalpy], [$m^2 dot s^(-2)$],
    [$k$], [thermal conductivity], [$"kg" dot m dot s^(-3) dot K^(-1)$],
    [$S_(i j)$], [deviatoric stress tensor], [$"kg" dot m^(-1) dot s^(-2)$],
    [$tau_(i j)$], [viscous stress tensor], [$"kg" dot m^(-1) dot s^(-2)$],
    [$delta_(i j)$], [Kronecker delta], [1],
    [$I_(i j)$], [identity tensor], [1],
  )

  算子

  #table(
    columns: (1fr, auto),
    align: (left, left),
    stroke: none,
    inset: (left: 0pt),
    table.header()[*Symbol*][*Description*],
    [$Delta$], [difference],
    [$nabla$], [gradient operator],
    [$delta^(plus.minus)$], [upwind-biased interpolation scheme],
  )

  缩写

  #table(
    columns: (1fr, auto),
    align: (left, left),
    stroke: none,
    inset: (left: 0pt),
    table.header()[*Symbol*][*Description*],
    [CFD], [Computational Fluid Dynamics],
    [CFL], [Courant-Friedrichs-Lewy],
    [EOS], [Equation of State],
    [JWL], [Jones-Wilkins-Lee],
    [WENO], [Weighted Essentially Non-Oscillatory],
    [ZND], [Zeldovich-von Neumann-Döring],
  )
]

// 正文
#show: mainmatter

= 绪论<chap:introduction>

== 背景

2022年修订的《中国科学院大学 研究生学位论文撰写规范和指导意见》（以下简称《指导意见》）从2023年冬季批次开始实施。为方便各位同学使用，特提供此模板。

您在使用此模板进行学位论文撰写时，只需根据《指导意见》在相应章节填写具体内容即可。

本模板在第2章提供了本模板的使用说明，在第3章中提供了《指导意见》中关于内容和格式的部分要求，请仔细阅读。

== 系统要求<sec:system>

#link("https://typst.app/")[Typst]是一款现代化的排版系统，支持在主流编辑器和编译环境（如 VS Code、Neovim、Emacs 等）中高效工作。Typst 采用即时编译技术，用户能够实时预览文档渲染结果，极大提升了学术及专业文档的编写体验。与传统的 LaTeX 系统相比，Typst 拥有更为简洁明了的语法设计，降低了学习曲线，非常适合初学者及非专业排版用户使用。

当前，Typst 官方已提供跨平台支持，兼容 Windows、Linux、macOS 以及网页版（Typst Web App）。用户可通过各软件的官方网站获取最新版本，建议避免使用非官方渠道下载。编辑器与 Typst CLI 安装完成后，即可实现本地编译，无需额外配置。对于初学者，推荐直接使用 Typst Web App 进行在线编辑与预览，无需本地环境配置，且支持多人协作。值得注意的是，Typst 不依赖于传统 LaTeX 编译引擎，而基于 WebAssembly 技术实现高效渲染，具备良好的跨平台兼容性，能够满足绝大多数用户的学术写作需求。

#figure(
  table(
    columns: 6,
    align: center,
    table.header()[名称][编辑器][编译器环境][预览方案][是否支持即时编译][语言服务],
    [WebAPP], [Code Mirror], [wasm], [渲染图片], [是], [优秀],
    [VSCode], [VSCode], [native], [webview], [是], [良好],
    [neovim], [neovim], [native], [webview], [是], [良好],
    [Emacs], [Emacs], [native], [webview], [是], [良好],
    [typst-cli], [任意编辑器], [native], [PDF阅读器], [否], [无],
  ),
  caption: [支持的Typst的编译环境和编辑器],
)<tab:Typst_intro>

= Typst使用说明<chap:guide>

为了方便使用并更好地展示Typst的现代排版特性，本模板框架和文件结构经过精细设计，尽可能模块化各个功能和板块，以方便用户进行高效编辑。

== 文档目录简介
=== template目录
- `thesis.typ` 文件: 你的论文源文件，可以随意更改这个文件的名字，甚至你可以将这个文件在同级目录下复制多份，维持多个版本。
- `ref.bib` 文件: 用于放置参考文献。
- `images` 目录: 用于放置图片。。

=== 编译脚本
为方便本地编译，提供适用于不同操作系统的命令：

- Windows：通过 `typst compile thesis.typ` 生成PDF文件。
- Linux或MacOS：在终端中运行 `typst compile thesis.typ` 来快速编译。

在写作过程中，Typst支持实时预览，无需重复执行编译命令。

== 功能介绍

=== 列表

==== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

==== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

==== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

=== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:ucas-logo。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (
  stack(dir: ltr)[
    #figure(
      table(
        align: center + horizon,
        columns: 4,
        [t], [1], [2], [3],
        [y], [0.3s], [0.4s], [0.8s],
      ),
      caption: [常规表],
    ) <timing>
  ][
    #h(50pt)
  ][
    #figure(
      table(
        columns: 4,
        stroke: none,
        table.hline(),
        [t],
        [1],
        [2],
        [3],
        table.hline(stroke: .5pt),
        [y],
        [0.3s],
        [0.4s],
        [0.8s],
        table.hline(),
      ),
      caption: [三线表],
    ) <timing-tlt>
  ]
))

#figure(
  image("images/ucas-emblem.svg", width: 20%),
  caption: [图片测试],
) <ucas-logo>

=== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

=== 参考文献

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

=== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption: [代码块],
) <code>

= 中国科学院大学研究生学位论文撰写规范指导意见（节选）<chap:ucas>

学位论文是研究生在掌握已有的科学知识的基础上，运用科学思维和一定的科学方法、技术与工具，面向特定的科学领域所存在的科学问题，开展创新性研究而产生的科学研究成果。

学位论文是研究生科研工作成果的集中体现，是评判学位申请者学术水平、授予其学位的主要依据，是科研领域重要的文献资料。撰写学位论文是对研究生科学研究能力的基本训练，是研究生学业与研究成效的基本检验，也是科研与创新能力的重要体现。

为提高研究生学位论文的撰写质量，促进学位论文在内容和格式上的规范化，参照《学位论文编写规则》（GB/T 7713.1—2006）、《信息与文献 参考文献著录规则》（GB/T 7714—2015）和《学术出版规范
期刊学术不端行为界定》（CY/T
174—2019）等国家有关标准，特制定本指导意见（2021年修订）。各学科群学位评定分委员会（以下简称各学科群分会）可结合本学科领域的特点，参考本指导意见，制订符合本学科领域特点与要求的学位论文撰写具体要求。

本指导意见从2023年冬季批次开始实施。

== 组成及要求

学位论文一般由以下几个部分组成：封面、原创性声明及授权使用声明、摘要、目录、符号说明（若有）、正文、参考文献、附录（若有）、致谢、作者简历及攻读学位期间发表的学术论文与其他相关学术成果等。

=== 封面

一律采用中国科学院大学规定的统一中英文封面，封面包含内容如下：
#set enum(numbering: "（1）")
+ 密级,涉密或延迟公开论文必须在论文封面标注密级，同时注明保密年限。公开论文不标注密级，可删除此行。
+ 论文题目，应简明扼要地概括和反映整个论文的核心内容，一般不宜超过25个汉字（符），英文题目一般不应超过150个字母，必要时可加副标题。题目中应尽量避免使用缩略词、首字母缩写词、字符、代号和公式等。
+ 作者姓名,根据《中国人名汉语拼音字母拼写规则》（GB/T 28039—2011），英文封面中的姓和名分写，姓在前，名在后，姓名之间用空格分开。姓和名需写全拼，姓全大写，名首字母大写。外国留学生姓名书写顺序以护照格式为准，字母全部大写。
+ 指导教师，需同时填写导师姓名、专业技术职务和工作单位。如果有多位导师（均需经培养单位批准，并在学籍系统备案），第一导师在前，第二导师等依次在后。学位论文在指导小组的指导下完成的，应注明指导小组成员相应信息。
+ 学位类别，包括学科门类（学术型）或专业学位类别以及学位级别。学科门类如理学、医学等，专业学位类别如应用统计、工商管理等。学位级别包括硕士、博士。
+ 学科专业，填写攻读学位的一级学科/二级学科或专业学位类别/领域全称，须与学籍信息一致，不可用简写。
+ 培养单位，填写就读研究所或学院、系全称，如中国科学院××研究所、中国科学院大学××学院。
+ 时间，填写论文提交学位授予单位的年月，使用阿拉伯数字标注。一般夏季申请学位的论文标注6月，冬季申请学位的论文标注12月。例如：2023年6月，2023年12月。

=== 原创性声明及授权使用声明

本部分内容提供统一的模版，提交时作者和导师须亲笔签名。如遇导师无法签字时，培养单位应做出适当处理。

=== 摘要和关键词

论文摘要包括中文摘要和英文摘要（Abstract）两部分。论文摘要应概括地反映出本论文的主要内容，说明本论文的主要研究目的、内容、方法、结论。要突出本论文的创造性成果或新见解，不宜使用公式、图表、表格或其他插图材料，不标注引用文献。中文摘要的字数由各学科群分会根据本分会涉及学科专业的特点提出具体要求。英文摘要与中文摘要内容应保持一致。留学生用其他语种撰写学位论文时，应有详细的中文摘要，字数由各学科群分会具体制定，建议一般不少于5000字。

摘要最后注明本文的关键词（3～5个）。关键词是为了文献标引和检索工作，从论文中选取出来，用以表示全文主题内容信息的单词或术语。关键词以显著的字符另起一行并隔行排列于摘要下方，左顶格，中文关键词间用中文逗号隔开。英文关键词应与中文关键词对应，首字母应大写，用英文逗号隔开。

摘要应另起一页，与正文前的内容连续编页（用罗马字符）。

=== 目录

目录应包括论文正文中的全部内容的标题，以及参考文献、附录（若有）和致谢等，不包括中英文摘要。目录页由论文的章、条、附录等序号、名称和页码组成。正文章节题名要求最多编到第三级标题，即×.×.×（如1.1.1）。一级标题顶格书写，二级标题缩进一个汉字符位置，三级标题缩进两个汉字符位置。论文中若有图表，应有图表目录，置于目录页之后，另页编排。图表目录应有序号、图题或表题和页码。

目录应另起一页，与正文前的内容连续编页（用罗马字符）。

=== 符号说明（若有）

如果论文中使用了大量的物理量符号、标志、缩略词、专门计量单位、自定义名词和术语等，应编写成注释说明汇集表。若上述符号等使用数量不多，可以不设此部分，但必须在论文中首次出现时加以说明。
论文中若有符号说明，应置于目录之后、正文之前，另起一页，与正文前的内容连续编页（用罗马字符）。

=== 正文
正文一般包括绪论、论文主体、研究结论与展望等部分。

#set enum(numbering: "（1）")
+ 绪论应包括选题的背景和意义，国内外相关研究成果与进展述评，本论文所要解决的科学与技术问题、所运用的主要理论和方法、基本思路和论文结构等。绪论应独立成章，用足够的文字叙述，不与摘要雷同。要实事求是，不夸大也不弱化前人的工作和自己的工作。
+ 论文主体是正文的核心部分，占主要篇幅，它是将学习和研究过程中调查、观察和测试所获得的材料和数据，经过思考判断、加工整理和分析研究，进而形成论点。依据学科专业及具体选题，论文主体可以有不同的表现形式，可以按照章与节的结构表述，也可以按照“研究背景与意义—研究方法与过程—研究结果与讨论”的表述形式组织论文。但主体内容必须实事求是，客观诚实，准确完备，合乎逻辑，层次分明，简明可读。
+ 研究结论是对整个论文主要成果的总结，不是正文中各章小结的简单重复，应准确、完整、明确、精炼。应明确凝练出本研究的主要创新点，对论文的学术价值和应用价值等加以分析和评价，说明本项研究的局限性或研究中尚难解决的问题，并提出今后进一步在本研究方向进行研究工作的设想或建议。结论部分应严格区分本人研究成果与他人科研成果的界限。

=== 参考文献

本着严谨求实的科学态度撰写论文，凡学位论文中有引用或参考、借鉴他人思想或成果之处，均应按一定的引用规范，列于文末（通篇正文之后），参考文献部分应与正文的文献引用一一对应，注重合理引用，严禁抄袭剽窃等学术不端行为。

=== 附录（若有）

主要列入正文内过分冗长的公式推导、供查读方便所需的辅助性数学工具或表格、数据图表、程序全文及说明、调查问卷、实验说明等。

=== 致谢

对给予各类资助、指导和协助完成研究工作，以及提供各种对论文工作有利条件的单位及个人表示感谢。致谢应实事求是，切忌浮夸与庸俗之词。致谢末尾应具日期，日期与论文封面一致。

=== 作者简历及攻读学位期间发表的学术论文与其他相关学术成果

作者简历应包括从大学起到申请学位时的个人学习工作经历。按学术论文发表的时间顺序，列出作者本人在攻读学位期间发表或已录用的学术论文清单（著录格式同参考文献）。其他相关学术成果可以是申请的专利、获得的奖项及完成的项目等代表本人学术成就的各类成果。

== 撰写要求

=== 学位论文基本要求

学位论文必须是一篇系统的、完整的学术论文，遵循既定的学术规范与要求，不仅要符合学位论文的形式规范，更要符合学位论文的质量规范。做到：学术观点明确，立论正确，方法科学，材料翔实，数据可靠，推理严谨，论证充分，引用规范，结构合理，层次分明，文字通顺，表达准确，学风严谨。研究成果体现作者独到的学术见解、科学论证与创新性结论，表明作者掌握了坚实的基础理论和系统的专门知识，具有独立地从事科学研究的能力。

硕士学位论文选题应为本学科重要领域，有一定的理论意义或应用价值；在理论或方法上有一定的创新，解决了科学或生产实践中某一项重要的问题，取得重要的研究成果，具有较好的社会效益或应用前景。

博士学位论文选题应为本学科前沿领域，有重要的理论意义或应用价值；在理论或方法上有较大的创新，解决了科学或生产实践中某一项重大的问题，取得突破性的研究成果，具有重要的社会效益或应用前景。

=== 论文原创性要求

学位论文应为学位申请者在导师的指导下独立完成的科学研究成果，为作者本人的原创性成果，系研究生经过多年的专业学习和科学研究，运用科学思维、科学方法或工具，探索科学领域中的某一科学问题，提出问题，分析问题，解决问题。学位论文中要有清晰完整的文献综述，但不能以文献综述来代替学位论文。论文引用规范合理，没有伪造、篡改、剽窃、他人代写、论文买卖及其它学术不端行为。

=== 论文创新性要求

学位论文的研究既包括创造知识，即创新、发现和发明，是对未知世界及其规律的探索，也包括整理知识，即对已有知识分析整理，使其规范化、系统化，是对已有知识的传承。创新活动，贯穿了学位论文研究与写作的全过程，如提出新的学术思想、科学概念、假说、学说、定理、定律，设计新的观察方法和实验手段，建立新的科学模型，研制出新的产品，设计出新的工艺流程，发现新的物种等。学位论文的价值在于探索未知，发现科学发展中的规律与特征。学位论文要体现其应有的严谨性与探索性，在原创性的基础上实现对已有知识的超越、突破或颠覆，发现前所未有的科学问题，提出前所未有的分析论证，得出前所未有的科学结论。

=== 学位论文的字数要求
学位论文最重要的意义在于其学术研究的创新性，应将学位论文的质量水平作为主要考量，不以字数多少作为特别要求，但各学科群分会可根据本领域涉及的学科专业特点做相应规定。

=== 文字、标点符号和数字

除外国来华留学生、外语专业研究生以及特殊需要外，学位论文一律用国家正式公布实施的简化汉字书写。标点符号的用法以《标点符号用法》（GB/T 15834—2011）为准。数字用法以《出版物上数字用法》（GB/T 15835—2011）为准。

外国来华留学生可用中文或英文撰写学位论文，但应有详细的中英文摘要。外语专业的学位论文应用所学专业相应的语言撰写，摘要应使用中文和所学专业相应的语言对照撰写。

为了便于国际合作与交流，中文学位论文亦可有英文或其他文字的副本。

=== 论文正文

==== 章节和各章标题

论文正文须由另页右页（奇数页）开始，用阿拉伯数字连续编码，一直到全文最后。正文内部新章节无须另页右页（奇数页）开始。
论文可参考“绪论-研究背景与意义-研究方法与过程-研究结果与讨论-研究结论与展望”的结构形式撰写，各主体研究内容可分别单独成为章节并作为章节标题使用。

各章标题中尽量不采用英文缩写词，对必须采用者，应使用本行业的通用缩写词。标题中尽量不使用标点符号。

==== 序号

#strong[标题序号]

论文标题分层设序。层次以少为宜，根据实际需要选择。各层次标题一律用阿拉伯数字连续编号。以三级标题为宜，最多四级。若确需要再增加一级，以小括号形式表示；不同层次的数字之间用小圆点“.”相隔，末位数字后面不加点号，如“1.1”，“1.1.1”等；章的标题居中排版，各层次的序号均左起顶格排，序号与题名间空一个汉字符。

#strong[图表等编号]

论文中的图、表、附注、公式、算式等，一律用阿拉伯数字分章依序连续编码。其标注形式应便于互相区别，如：图1-1（第1章第一个图）、图2-2（第2章第二个图）；表3-2（第3章第二个表）等。附录的图表参考正文的编号方式，如附图1-1或附表1-1。

#strong[页码]

正文页码从绪论开始按阿拉伯数字（1，2，3……）连续编排，页码应位居左页左下角、右页右下角；正文前的部分（中英文摘要、目录等）用大写罗马数字（I，II，III…）单独编排，页码位于页面下方居中。

==== 页眉

页眉从摘要开始，奇数页上标明“摘要”、“Abstract”、“目录”、“图表目录”等，偶数页上标明论文题目（英文摘要标明英文题目）。正文（即第1章开始到最后一章）的页眉，奇数页上标明每一章名称，偶数页上标明论文题目。参考文献、附录、致谢等的页眉，奇数页标明“参考文献”、“附录”、“致谢”等，偶数页标明论文题目。页眉居中设置。

==== 名词和术语
科技名词术语及设备、元件的名称，应采用全国科学技术名词审定委员会公布的权威标准或其他相关权威信息源规定的术语或名称。标准中未规定的术语要采用行业通用术语或名称。全文名词术语必须统一。一些特殊名词或新名词应在适当位置加以说明或注解。双名法的生物学名部分均为拉丁文，并为斜体字。

采用英语缩写词时，除本行业广泛应用的通用缩写词外，文中第一次出现的缩写词应该用括号注明英文原词。新的外来名词应用括号注明英语全称和缩写语。

==== 量和单位

量和单位要严格执行《国际单位制及其应用》（GB 3100-93）、《有关量、单位和符号的一般原则》（GB3101—93）有关量和单位的规定。量的符号一般为单个拉丁字母或希腊字母，并一律采用斜体（pH例外）。

==== 图和表

论文中若有图和表，应设置图表目录，先列图后列表，置于目录页后，另页编排。

#strong[(1) 图]

图片大小适当，图边界在页面范围内（图边界离页面边界距离大于页边距）。若图片中包含文字，文字大小不超过正文文字大小。 图包括曲线图、构造图、示意图、框图、流程图、记录图、地图、照片等，宜插入正文适当位置。引用的图必须注明来源。具体要求如下：

- 图应具有“自明性”，即只看图、图题和图注，不阅读正文，就可理解图意。每一图应有简短确切的图题，连同图序置于图下居中。
- 图中的符号标记、代码及实验条件等，可用最简练的文字横排于图框内或图框外的某一部位作为图注说明，全文统一。图题建议用中文及英文两种文字表达。
- 照片图要求主要显示部分的轮廓鲜明，便于制版，如用放大、缩小的复制品，必须清晰，反差适中，照片上应有表示目的物尺寸的标尺。
- 图片一般设为高6cm×宽8cm，但高、宽也可根据图片量及排版需要按比例缩放。中文（宋体）英文（Times New Roman）图注为五号字，1.25倍行距。
- 文中尽量不用世界地图、全国地图！如果一定要用，凡涉国界图件（国内部分地区、全国、世界部分地区、全球）必须使用自然资源部标准地图底图（下载网址：http://bzdt.ch.mnr.gov.cn），所用底图边界要完全无修改（包括南海诸岛位置），为适应排版时图的缩放，比-
  例尺一律用线段比例尺，而不用数字比例尺。并在图题下注明“注：该图基于自然资源部标准地图服务网站下载的审图号为GS(2021)××××号的标准地图制作，底图边界无修改。”

#strong[(2) 表]

表的编排一般是内容和测试项目由左至右横读，数据依序竖排，应有自明性，引用的表必须注明来源。具体要求如下：

- 每一表应有简短确切的题名，连同表序置于表上居中。必要时，应将表中的符号、标记、代码及需说明的事项，以最简练的文字横排于表下作为表注。表题建议用中文及英文两种文字表达。
- 表内同一栏数字必须上下对齐。表内不应用“同上”、“同左”等类似词及“″”符号，一律填入具体数字或文字，表内“空白”代表无此项，“—”或“…”（因“—”可能与代表阴性反应相混）代表未发现，“0”该表实测结果为零。表内未测出值可以用“N.D.
  ”表示。
- 表格尽量用“三线表”，避免出现竖线，避免使用过大的表格，确有必要时可采用卧排表，正确方位应为“顶左底右”，即表顶朝左，表底朝右。表格太大需要转页时，需要在续表表头上方注明“续表”，表头也应重复排出。
- 中文（宋体）英文（Times New Roman）表注为五号字，1.25倍行距。

==== 表达式

论文中的表达式需另行起，原则上应居中。若有两个以上的表达式，应从“1”开始的阿拉伯数字进行编号，并将编号置于括号内。编号采用右端对齐。表达式较多时可分章编号。

较长的表达式如必须转行，只能在+，-，×，÷，＜，＞等运算符之后转行，序号编于最后一行右顶格。

=== 参考文献
参考文献格式规范参照《信息与文献 参考文献著录规则》（GB/T
7714—2015），或可参照国际刊物通行的参考文献格式。各学科群分会可根据本学科的一般规范制定相应的参考文献格式。文后参考文献和参考文献在正文中的标注方式可采用“顺序编码制”或“著者—出版年制”。确定采用某种方法后，文后参考文献和参考文献在正文中的标注方式要对应。

文后参考文献按“顺序编码制”组织时，各篇文献应按正文部分首次引用时标注的序号依次列出；文后参考文献按“著者—出版年制”组织时，条目不排序号，先按语种分类排列，语种顺序是：中文、日文、西文、俄文、其他文种；然后按著者字序和出版年排列。中文和日文按第一著者的姓氏笔画排序，中文也可按汉语拼音字母顺序排列，西文和俄文按第一著者姓氏字母顺序排列。当一个著者有多篇文献并为第一著者时，该著者单独署名的文献排在前面（并按出版年份的先后排列），接着排该著者与其他人合写的文献。
文后参考文献加标题“参考文献”，并列入全文目录。 凡正文里标注了参考文献的，其文献都必须列入文后参考文献。文后参考文献应集中著录于正文之后，不分章节著录。 正文中未被引用但被阅读或具有补充信息的文献可集中列入附录中，其标题为“荐读书目”。

详细内容请参考《中国科学院大学研究生学位论文撰写规范指导意见》。

== 排版与印刷要求

#figure(
  table(
    align: center,
    columns: 2,
    [项目名称], [要求],
    [纸张], [A4（210mm×297mm），幅面白色],
    [页面设置], [上、下2.54cm，左、右3.17cm，页眉、页脚距页边界1.5cm],
    [封面], [采用国科大统一格式],
    [页眉], [宋体小五号居中，英文和阿拉伯数字用Times New Roman体],
    [页码], [Times New Roman体小五号],
  ),
  caption: [排版和印刷要求],
)<tab:typo_and_print_require>

=== 印刷及装订要求
论文封面使用中国科学院大学统一的封面格式。学位论文用A4标准纸（210 mm×297
mm）打印、印刷或复印，按顺序装订成册。自中文摘要起双面印刷，之前部分单面印刷。中文摘要、英文摘要、目录、论文正文、参考文献、附录、致谢、作者简历及攻读学位期间发表的学术论文与其他相关学术成果等，均须由另页右页（奇数页）开始。论文必须用线装或热胶装订，不使用钉子装订。封面用纸一般为150克花纹纸（需保证论文封面印刷质量，字迹清晰、不脱落），博士学位论文封面颜色为红色，硕士学位论文封面颜色为蓝色。

=== 书脊
学位论文的书脊用黑体，英文和阿拉伯数字用Times New Roman体，字号一般为小四号，可根据论文厚度适当调整。上方写论文题目，中间写作者姓名，下方写“中国科学院大学”，距上下边界均为3cm左右。


// 手动分页
#if twoside {
  pagebreak() + " "
}

// 中英双语参考文献
// 默认使用 gb-7714-2015-numeric 样式
#bilingual-bibliography(full: true)

// 附录
#show: appendix

= 附录

#align(center)[#strong[学位类别中英文对照表]]

#let scd = [学术型\ 博士]
#let scm = [学术型\ 硕士]
#let pd = [专业学位\ 博士]
#let pm = [专业学位\ 硕士]
#let dp = [Doctor of Philosophy]
#set par(leading: 0.65em)
#table(
  columns: (auto, auto, auto),
  align: (center, center, center),
  table.header([学位类别], [中文名称], [英文名称]),
  table.cell(rowspan: 8, align: horizon, scd),
  [哲学博士],
  table.cell(rowspan: 8, align: horizon, dp),
  [经济学博士],
  [历史学博士],
  [理学博士],
  [工学博士],
  [农学博士],
  [医学博士],
  [管理学博士],
  table.cell(rowspan: 10, align: horizon, scm),
  [哲学硕士],
  [Master of Philosophy],
  [经济学硕士], [Master of Economics],
  [法学硕士], [Master of Law],
  [文学硕士], [Master of Arts],
  [历史学硕士], [Master of History],
  [理学硕士], [Master of Natural Science],
  [工学硕士], [Master of Science in Engineering],
  [农学硕士], [Master of Agriculture],
  [医学硕士], [Master of Medicine],
  [管理学硕士], [Master of Management Science],
  [专业学位\ 博士],
  [材料与化工博士\*],
  [Doctor of Materials and Chemical\ Engineering],
  table.cell(rowspan: 17, align: horizon, pm),
  [金融硕士], [Master of Finance],
  [应用统计硕士], [Master of Applied Statistics],
  [应用心理硕士], [Master of Applied Psychology],
  [翻译硕士], [Master of Translation and Interpreting],
  [工程硕士（调整前）\*], [Master of Engineering],
  [电子信息硕士\*], [Master of Electronic and Information\ Engineering],
  [机械硕士\*], [Master of Mechanical Engineering],
  [材料与化工硕士\*], [Master of Materials and Chemical Engineering],
  [资源与环境硕士\*], [Master of Resources and Environmental\ Engineering],
  [能源动力硕士\*], [Master of Energy and Power Engineering],
  [土木水利硕士\*], [Master of Civil and Hydraulic Engineering],
  [生物与医药硕士\*], [Master of Biological and Pharmaceutical\ Engineering],
  [农业硕士], [Master of Agriculture],
  [药学硕士], [Master of Pharmacy],
  [工商管理硕士], [Master of Business Administration],
  [公共管理硕士], [Master of Public Administration],
  [工程管理硕士], [Master of Engineering Management],
)

// 致谢
#acknowledgement[
  感谢 typst-ucas-thesis。
]


#backmatter[
  // 作者简历部分
  #strong[作者简历：]


  ××××年××月——××××年××月，在××大学××院（系）获得学士学位。

  ××××年××月——××××年××月，在××大学××院（系）获得硕士学位。

  ××××年××月——××××年××月，在中国科学院××研究所（或中国科学院大学××院系）攻读博士/硕士学位。

  工作经历：


  // 学术论文部分
  #v(1em)
  #strong[已发表（或正式接受）的学术论文：（书写格式同参考文献）]

  (1) 已发表工作 1

  (2) 已发表工作 2

  // 专利部分
  #v(1em)
  #strong[申请或已获得的专利：（无专利时此项不必列出）]

  (1) 专利名称

  (2) 专利名称

  // 研究项目及获奖情况
  #v(1em)
  #strong[参加的研究项目及获奖情况：]

  (1) 项目名称

  (2) 获奖名称
]

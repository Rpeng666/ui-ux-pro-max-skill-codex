# UI/UX Pro Max for Codex

[English](README.md) | 简体中文

一个 Codex 设计智能 skill，内置可搜索的数据库：84 种 UI 风格、161 套配色方案、73 组字体搭配、99 条 UX 准则、25 种图表类型，覆盖 22 个技术栈。

无需 npm CLI 依赖。`SKILL.md` 已预构建，通过一个 `install.sh` 即可复制到 `.codex/skills/`。安装时不需要 Node、bun，也不需要任何构建步骤。

## 功能

一个可搜索的设计智能数据库，Codex 在构建 UI 时可以使用：

- **84 种 UI 风格**，包含配色、效果和实现指南
- **161 套配色方案**，支持浅色/深色模式
- **73 组字体搭配**，集成 Google Fonts
- **99 条 UX 准则**，覆盖无障碍、触控、布局、导航
- **25 种图表类型**，包含无障碍和响应式指南
- **22 个技术栈**（React、Next.js、Vue、Svelte、Tailwind、shadcn 等）
- **设计系统生成器**，支持持久化（Master + 页面级覆盖）
- **子 skill**：banner-design、brand、design、design-system、slides、ui-styling

## 快速安装

```bash
# 克隆本仓库
git clone <your-repo-url> ui-ux-pro-max-skill
cd ui-ux-pro-max-skill

# 安装到当前项目
./install.sh

# 或安装到指定项目
./install.sh /path/to/your/project

# 或全局安装（~/.codex/）
./install.sh --global
```

安装后的目录结构：

```
.codex/
  skills/
    ui-ux-pro-max/       # 主 skill
      SKILL.md            # 预构建，开箱即用
      data/               # CSV 数据库（风格、配色、字体等）
      scripts/            # Python 搜索引擎（仅依赖标准库）
    banner-design/        # 子 skill：横幅设计
    brand/                # 子 skill：品牌识别
    design/               # 子 skill：综合设计
    design-system/        # 子 skill：设计系统构建
    slides/               # 子 skill：HTML 演示文稿
    ui-styling/           # 子 skill：UI 样式指南
```

## 环境要求

- **Python 3**（仅标准库，无需 pip 安装任何包）
- 就这些。不需要 Node、npm、bun。

检查 Python：

```bash
python3 --version
```

## Codex 如何使用

安装后，Codex 会自动通过 `.codex/skills/ui-ux-pro-max/SKILL.md` 发现此 skill。当你要求 Codex 构建 UI 时，它可以：

1. **生成设计系统**：`python3 skills/ui-ux-pro-max/scripts/search.py "saas landing page" --design-system`
2. **搜索风格**：`python3 skills/ui-ux-pro-max/scripts/search.py "fintech dashboard" --domain style`
3. **搜索配色**：`python3 skills/ui-ux-pro-max/scripts/search.py "warm minimal" --domain color`
4. **搜索 UX 规则**：`python3 skills/ui-ux-pro-max/scripts/search.py "form validation" --domain ux`
5. **搜索技术栈最佳实践**：`python3 skills/ui-ux-pro-max/scripts/search.py "react performance" --stack react`

## 重新构建 SKILL.md

`dist/SKILL.md` 已预构建并提交到仓库。仅当修改了模板后才需要重新构建：

```bash
node scripts/build-codex-skill.mjs
```

该脚本从 `cli/assets/templates/` 读取模板并生成 `dist/SKILL.md`。

## 与上游同步

本仓库跟踪上游仓库：

```bash
git remote -v
# upstream  https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git

# 拉取上游更新
git fetch upstream
git merge upstream/main

# 如果模板有变化，重新构建 SKILL.md
node scripts/build-codex-skill.mjs
```

### 自动同步（GitHub Actions）

一个每周运行的 GitHub Actions workflow（`.github/workflows/sync-upstream.yml`）会自动：

1. 从 `upstream/main` 拉取最新提交
2. 合并到本仓库
3. 如果我们自定义的文件（`README.md`、`.gitignore`）出现冲突，保留我们的版本
4. 从更新后的模板重新构建 `dist/SKILL.md`
5. 推送到 `main`
6. 如果在我们**未自定义的文件**中出现冲突，自动创建 PR 供手动审查

使用方法：
- 将仓库推送到 GitHub
- 在 repo 设置中开启 Actions（Settings > Actions > Allow all actions）
- workflow 每周一 06:00 UTC 运行，也可在 Actions 页面手动触发

## 项目结构

```
.
├── install.sh                  # 一键安装脚本
├── dist/
│   └── SKILL.md                # 预构建的 Codex skill 文件
├── scripts/
│   └── build-codex-skill.mjs   # 从模板重新构建 dist/SKILL.md
├── cli/assets/                  # 源数据、脚本和模板
│   ├── data/                    # CSV 数据库
│   ├── scripts/                 # Python 搜索引擎
│   ├── skills/                  # 子 skill（横幅、品牌等）
│   └── templates/               # SKILL.md 模板 + 平台配置
├── src/ui-ux-pro-max/           # 原始源码（数据 + 脚本）
└── README.md                    # 英文文档
```

## 许可证

MIT 许可证。详见 [LICENSE](LICENSE)。

本项目源自 [ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)，原作者为 [NextLevelBuilder](https://github.com/nextlevelbuilder)，原始协议为 MIT。所有设计数据、Python 脚本和智能内容均来自上游项目。本仓库仅修改了安装方式（预构建 SKILL.md + shell 安装脚本替代 npm CLI），并添加了通过 GitHub Actions 实现的自动上游同步功能。

按 MIT 协议要求，原始版权声明已保留在 LICENSE 文件中。

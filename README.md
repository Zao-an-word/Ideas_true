# 文思成真 🖋️✨
> 一个基于大语言模型与多智能体系统的智能小说创作平台
> 融合多模型能力，一站式解决小说创作、图文生成、人物关系构建等创作全流程需求

---

## 📋 目录
- [项目简介](#📦-项目简介)
- [技术栈](#🔧-技术栈)
- [核心功能](#🎯-核心功能)
- [环境要求](#🖥️-环境要求)
- [快速部署](#🚀-快速部署)
  - [后端部署（FastAPI）](#①-后端部署fastapi)
  - [前端部署（Vue 3）](#②-前端部署vue-3)
  - [环境变量配置](#③-环境变量配置-可选)
- [数据结构说明](#🧱-数据结构说明)
- [使用指南](#📖-使用指南)
- [常见问题排查](#🔍-常见问题排查)
- [目录结构](#📁-目录结构概览)
- [贡献指南](#🤝-贡献指南)
- [许可证](#📄-许可证)
- [联系方式](#📌-联系方式)

---

## 🔧 技术栈
以下是本项目采用的核心技术栈，按前后端及功能模块分类：

### 🌐 核心框架与基础设施
| 技术/工具 | 版本/类型 | 用途 |
| :--- | :--- | :--- |
| **Python** | ≥ 3.12 | 核心开发语言，运行后端逻辑 |
| **FastAPI** | 最新版 | 高性能 Web 框架，构建 RESTful API 与 WebSocket |
| **Vue 3** | ≥ 3.3.x | 前端渐进式框架，构建用户交互界面 |
| **MySQL** | ≥ 8.0 | 关系型数据库，存储用户数据与创作内容 |
| **Node.js** | ≥ 18.x | 运行 JavaScript 环境，用于前端构建与包管理 |

### 🧠 AI 与第三方服务集成
| 技术/服务 | 用途 |
| :--- | :--- |
| **Deepseek / Qwen / OpenAI** | 大语言模型（LLM），提供小说生成、润色、逻辑推理能力 |
| **DashScope** | 阿里云通义千问图像生成 API，提供小说场景/人物图片生成 |
| **SerpAPI** | 联网搜索 API，为创作提供实时资料查询与素材支持 |

### 🛠️ 开发工具与环境
| 技术/工具 | 用途 |
| :--- | :--- |
| **Conda** | Python 环境与依赖管理（创建 `novel_env` 虚拟环境） |
| **pip / npm** | 包管理器（Python 与 Node.js 依赖安装） |
| **Uvicorn** | ASGI 服务器，运行 FastAPI 服务 |
| **Git** | 版本控制，管理项目源码 |

---

## 📦 项目简介
“文思成真” 是面向小说创作者的 AI 辅助创作平台，基于 FastAPI + Vue 3 技术栈构建，深度整合大语言模型（Deepseek、Qwen、OpenAI 等）、图像生成（DashScope）与联网搜索（SerpAPI）能力，提供：
- 智能化的小说内容生成与润色
- 可视化的人物关系图谱构建
- 多维度的创作素材联网查询
- 完善的用户创作数据管理

平台支持多模型灵活切换，适配不同创作场景的需求，后端采用模块化设计，前端兼顾交互体验与操作便捷性。

---

## 🎯 核心功能
| 功能模块         | 核心能力                                                                 |
|------------------|--------------------------------------------------------------------------|
| 小说生成         | 支持基于关键词/大纲的小说章节生成、内容润色、风格迁移                     |
| 图文创作         | 集成图像生成接口，可根据小说内容生成场景/人物配图                         |
| 人物关系构建     | 可视化编辑人物关系，自动生成人物档案与关系图谱                           |
| 联网查询         | 对接 SerpAPI，快速获取创作所需的现实素材、资料验证等信息                 |
| 多模型切换       | 支持 Deepseek、Qwen、OpenAI 等多模型无缝切换，适配不同创作风格           |
| 数据管理         | 基于 MySQL 存储用户信息、创作内容、会话记录，支持数据导出/备份           |

---

## 🖥️ 环境要求
| 类型         | 要求版本                | 备注                          |
|--------------|-------------------------|-------------------------------|
| 操作系统     | Windows 11 / Linux / macOS | Windows 11 为推荐环境         |
| Python       | ≥ 3.12                  | 建议使用 Conda 管理虚拟环境   |
| Node.js      | ≥ 18.x                  | 需包含 npm（≥ 8.x）或 yarn    |
| MySQL        | ≥ 8.0                   | 需提前启动 MySQL 服务         |
| 包管理器     | pip / conda / npm       | pip 建议升级至最新版          |
| 前端框架     | Vue 3                   | 基于 Vite 构建（兼容 Vue CLI）|
| 依赖工具     | Git                     | 可选，用于克隆项目            |

### 前置检查
```bash
# 检查 Python 版本
python --version
# 检查 Node.js 版本
node -v
# 检查 MySQL 服务状态（Windows）
net start mysql80
# 检查 MySQL 服务状态（Linux/macOS）
systemctl status mysqld
```

---

## 🚀 快速部署
> 部署前请确保已满足【环境要求】，并已克隆本项目至本地：
> ```bash
> git clone <项目仓库地址>
> cd 文思成真
> ```

### ① 后端部署（FastAPI）
#### 步骤 1：创建并激活虚拟环境
##### 方式 1：使用 environment.yml（推荐）
```bash
conda env create -f environment.yml
conda activate novel_env
```

##### 方式 2：手动创建
```bash
# 创建 Conda 虚拟环境
conda create -n novel_env python=3.12 -y
conda activate novel_env

# 进入后端目录并安装依赖
cd Backend
pip install --upgrade pip
pip install -r requirements.txt
```

#### 步骤 2：配置数据库连接
编辑 `Backend/app/core/config.py` 文件，修改数据库连接参数：
```python
# 数据库配置
DB_HOST = "localhost"       # 数据库地址
DB_PORT = 3306              # 数据库端口
DB_USER = "root"            # 数据库用户名
DB_PASSWORD = "yourpassword"# 数据库密码（替换为实际密码）
DB_NAME = "novel_db"        # 数据库名
DB_CHARSET = "utf8mb4"      # 字符集（支持emoji等特殊字符）

# 安全配置
SECRET_KEY = "your_secret_key"  # 替换为随机生成的密钥（建议≥32位）
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30  # Token 过期时间
```

#### 步骤 3：初始化数据库
##### 方式 1：自动建表（推荐）
```bash
python Backend/init_db.py
```

##### 方式 2：SQL 文件导入
```bash
# 先创建数据库
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS novel_db DEFAULT CHARACTER SET utf8mb4;"
# 导入表结构
mysql -u root -p novel_db < Backend/app/db/init.sql
```

#### 步骤 4：启动后端服务
```bash
cd Backend
# 开发环境（热重载）
uvicorn main:app --reload --host 0.0.0.0 --port 8000
# 生产环境（禁用热重载）
uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

✅ 验证后端启动成功：访问 [http://localhost:8000/docs](http://localhost:8000/docs) 查看接口文档

### ② 前端部署（Vue 3）
#### 步骤 1：进入前端目录
```bash
cd my-vue-app
```

#### 步骤 2：安装依赖
```bash
# 使用 npm
npm install
# 若安装缓慢，可切换淘宝镜像
npm install --registry=https://registry.npmmirror.com
# 或使用 yarn
yarn install
```

#### 步骤 3：配置后端接口地址
编辑 `my-vue-app/.env.development` 文件：
```env
VUE_APP_API_BASE_URL = "http://localhost:8000"  # 后端接口地址
```

#### 步骤 4：启动前端服务
```bash
# 开发环境
npm run serve
# 生产环境（构建静态文件）
npm run build
# 构建后可通过 nginx 部署 dist 目录
```

✅ 验证前端启动成功：访问 [http://localhost:8080](http://localhost:8080) 查看前端页面

### ③ 环境变量配置（可选）
为避免硬编码敏感信息（如 API 密钥、数据库密码），推荐使用 `.env` 文件管理环境变量：
1. 在 `Backend` 目录下创建 `.env` 文件：
```env
# 数据库配置
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=novel_db

# 第三方 API 配置
OPENAI_API_KEY=your_openai_key
DASHSCOPE_API_KEY=your_dashscope_key
SERPAPI_KEY=your_serpapi_key

# 安全配置
SECRET_KEY=your_secret_key
```
2. 修改 `config.py` 读取环境变量：
```python
from dotenv import load_dotenv
import os

load_dotenv()  # 加载 .env 文件

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PASSWORD = os.getenv("DB_PASSWORD")
# 其他配置同理
```

---

## 🧱 数据结构说明
核心数据库表结构由 `text_generator.sql` 定义，包含以下关键表：
| 表名         | 用途                                                                 |
|--------------|----------------------------------------------------------------------|
| `user`       | 存储用户基本信息、登录凭证、权限配置                                 |
| `novel`      | 存储小说基本信息（标题、大纲、创作状态、所属用户）                   |
| `novel_chapter` | 存储小说章节内容、章节标题、排序、更新时间等                         |
| `character`  | 存储人物档案（姓名、人设、所属小说）                                 |
| `character_relation` | 存储人物间的关系类型、描述等                                         |
| `conversation` | 存储用户与 AI 的创作会话记录                                         |

> 完整表结构及字段说明详见：`Backend/app/db/init.sql`

---

## 📖 使用指南
1. **首次登录**：启动前后端后，访问前端页面，完成注册/登录（默认管理员账号：admin / 123456，建议首次登录后修改）；
2. **创作小说**：进入「小说创作」模块，输入大纲/关键词，选择模型生成章节内容；
3. **图文生成**：在章节编辑页点击「配图生成」，根据内容生成场景/人物图片；
4. **人物关系构建**：进入「人物管理」模块，添加人物并编辑关系，自动生成关系图谱；
5. **联网查询**：在创作过程中点击「素材查询」，输入关键词获取外部资料。

---

## 🔍 常见问题排查
| 问题             | 可能原因                                  | 解决建议                                                                 |
|------------------|-------------------------------------------|--------------------------------------------------------------------------|
| 数据库连接失败    | 配置错误 / MySQL 未启动 / 端口被占用      | 1. 检查 `config.py` 中数据库参数<br>2. 启动 MySQL 服务<br>3. 检查 3306 端口是否被占用 |
| 前端页面空白      | 后端未启动 / 跨域配置错误 / 接口地址错误   | 1. 确认后端服务正常运行<br>2. 检查前端 `.env` 文件中接口地址<br>3. 确认后端跨域配置包含前端地址 |
| 依赖安装失败      | Python/Node 版本不匹配 / 网络问题         | 1. 升级 pip/npm 至最新版<br>2. 切换国内镜像源<br>3. 检查版本是否满足要求 |
| 跨域错误（CORS） | 后端未配置允许的前端源                    | 修改后端 `main.py` 中 `CORSMiddleware`：<br>`allow_origins = ["http://localhost:8080"]` |
| 模型调用失败      | API 密钥错误 / 网络不通 / 模型未开通      | 1. 检查第三方 API 密钥配置<br>2. 验证网络可访问模型接口<br>3. 确认模型服务已开通 |
| 前端启动报依赖错  | 依赖包冲突 / Node 版本过低                | 1. 删除 `node_modules` 和 `package-lock.json`<br>2. 重新执行 `npm install`<br>3. 升级 Node 至 18.x+ |

---

## 📁 目录结构概览
```
文思成真/
├── Backend/               # FastAPI 后端服务
│   ├── app/               # 核心应用模块
│   │   ├── core/          # 配置、常量、工具类
│   │   ├── api/           # 接口路由
│   │   ├── crud/          # 数据库操作
│   │   ├── models/        # 数据模型
│   │   ├── schemas/       # 数据校验模型
│   │   └── db/            # 数据库初始化脚本
│   ├── main.py            # 后端启动入口
│   ├── init_db.py         # 数据库初始化脚本
│   ├── requirements.txt   # Python 依赖清单
│   └── .env               # 环境变量配置（可选）
├── my-vue-app/            # Vue 前端项目
│   ├── src/               # 前端源码
│   │   ├── api/           # 接口请求封装
│   │   ├── components/    # 公共组件
│   │   ├── views/         # 页面视图
│   │   └── store/         # 状态管理
│   ├── .env.development   # 开发环境配置
│   └── package.json       # 前端依赖配置
├── environment.yml        # Conda 环境配置文件
├── text_generator.sql     # 数据库初始化脚本
└── README.md              # 项目说明文档
```

---

## 🤝 贡献指南
欢迎提交 Issue 和 Pull Request 参与项目开发：
1. Fork 本仓库；
2. 创建特性分支：`git checkout -b feature/xxx`；
3. 提交修改：`git commit -m "feat: 新增xxx功能"`；
4. 推送分支：`git push origin feature/xxx`；
5. 提交 Pull Request。

> 提交 PR 前请确保代码符合项目编码规范，且通过基础功能测试。

---

## 📄 许可证
本项目采用 MIT 许可证开源，允许自由使用、修改、分发，需保留版权声明。

---

## 📌 联系方式
- 邮箱：HLDCJY@outlook.com
- 审核人：-
- 更新时间：2025-07-24
- 项目版本：v1.0.0

---

### 🌟 致谢
感谢 FastAPI、Vue 3、Deepseek、Qwen 等开源项目/平台提供的技术支持。

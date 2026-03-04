
# 文思成真 🖋️✨  
> 一个基于大语言模型与多智能体系统的智能小说创作平台（组队项目）
> 
---

## 📦 项目简介
“文思成真” 是一个集小说生成、图文创作、人物关系图构建与联网查询于一体的 AI 辅助创作平台，后端采用 FastAPI 构建，前端基于 Vue 3 实现，支持多模型切换（如 Deepseek、Qwen、OpenAI）、图像生成（DashScope）与搜索能力（SerpAPI），并通过 MySQL 管理用户数据与创作内容。关于项目的部署，可以参考本文件，也可以参考同目录下的安装部署说明书。

---

## 🖥️ 环境要求

| 类型         | 要求版本        |
|--------------|-----------------|
| 操作系统     | Windows 11（建议） |
| Python       | ≥ 3.12           |
| Node.js      | ≥ 18.x           |
| MySQL        | ≥ 8.0            |
| 包管理器     | pip / conda / npm |
| 前端框架     | Vue 3            |

---

## ⚙️ 后端部署（FastAPI）

### ① 创建虚拟环境（任选其一）：
#### ✅ 使用 environment.yml（推荐）：
```bash
conda env create -f environment.yml
conda activate novel_env
```

#### ✅ 手动创建：
```bash
conda create -n novel_env python=3.12
conda activate novel_env
cd Backend
pip install -r requirements.txt
```

---

### ② 配置数据库连接  
编辑 `Backend/app/core/config.py` 文件，设置以下变量：

```python
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASSWORD = "yourpassword"
DB_NAME = "novel_db"
SECRET_KEY = "your_secret_key"
```

---

### ③ 初始化数据库（任选其一）：

- 方法 1：运行自动建表脚本  
  ```bash
  python Backend/init_db.py
  ```

- 方法 2：使用 SQL 文件导入  
  ```bash
  mysql -u root -p novel_db < Backend/app/db/init.sql
  ```

---

### ④ 启动后端服务：
```bash
cd Backend
uvicorn main:app --reload
```

访问接口文档：http://localhost:8000/docs

---

## 🖼️ 前端部署（Vue 3）

### ① 进入前端目录：
```bash
cd my-vue-app
```

### ② 安装依赖：
```bash
npm install
```

### ③ 启动开发服务器：
```bash
npm run serve
```

访问地址：http://localhost:8080

---

## 🧱 数据结构说明

数据库结构详见：
- `text_generator.sql`：定义用户、小说、消息、会话等核心表结构。
- 可选方案：运行 `init_db.py` 脚本快速建表。

---

## 🧪 常见问题排查

| 问题             | 可能原因                 | 解决建议                        |
|------------------|--------------------------|----------------------------------|
| 数据库连接失败    | `.env` 配置错误 / MySQL 未启动 | 检查配置与数据库服务状态           |
| 页面空白 / 报错   | 后端未启动 / 接口不通     | 启动后端服务，检查跨域配置         |
| 依赖安装失败      | `pip install` / `npm install` 未正确执行 | 重新安装依赖包                   |
| 跨域错误（CORS） | 未配置允许的前端源地址    | 设置 `CORSMiddleware` 中的 `allow_origins` |

---

## 📁 目录结构概览

```
文思成真/
├── Backend/               # FastAPI 后端服务
│   ├── app/               # 应用模块
│   ├── main.py            # 启动入口
│   ├── init_db.py         # 建表脚本
│   └── requirements.txt   # 依赖清单
├── my-vue-app/            # Vue 前端项目
├── environment.yml        # Conda 环境配置文件
└── text_generator.sql     # 数据库初始化脚本
```

---

## 📌 联系方式
HLDCJY@outlook.com
- 🧪 审核人：  
- 📅 更新时间：2025-07-24

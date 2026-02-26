📝 个人博客系统 | Personal Blog System

一个现代化、高性能的全栈个人博客解决方案

🌟 项目概述

个人博客系统是一个采用前后端分离架构的现代化全栈应用。项目以 Vue 3 构建优雅的前端界面，以 Spring Boot 提供稳健的后端服务，完整实现了从用户交互到数据存储的全链路开发。系统体现了清晰的模块化设计和工程化最佳实践，是展示技术能力的理想项目。

✨ 核心特性

🔐 安全认证体系

• 基于 JWT (JSON Web Token) 的完整身份认证与授权流程

• 安全的登录、注册、会话管理机制

• 多层权限控制，保护数据安全

🏗️ 模块化架构设计

• 前后端分离，职责清晰

• 采用分层架构模式，高内聚低耦合

• 代码结构清晰，便于维护与扩展迭代

🎨 现代化交互体验

• 基于 Element Plus UI 组件库构建

• 完全响应式设计，适配多端设备

• 流畅的动画过渡与友好的用户交互

🧠 智能状态管理

• 使用 Pinia 作为 Vue 3 官方状态管理库

• 类型安全的状态定义与使用

• 集中式、可预测的状态管理方案

⚡ 高性能后端服务

• 遵循 RESTful API 设计规范

• 结合 Spring Boot 的便捷与 MyBatis-Plus 的高效

• 提供稳定、高性能的接口服务

🛠️ 技术栈

前端技术栈

技术 版本/说明 作用

Vue 3 3.x 渐进式 JavaScript 框架

Vue Router 4.x 官方路由管理器

Pinia 2.x Vue 状态管理库

Element Plus 最新版 UI 组件库

TypeScript 5.x 类型安全的 JavaScript 超集

Vite 5.x 下一代前端构建工具

Axios 1.x HTTP 客户端库
后端技术栈
技术 版本/说明 作用

Spring Boot 2.x / 3.x Java 后端框架

Java 17+ 编程语言

MyBatis-Plus 最新版 ORM 框架

Spring Security 最新版 安全框架 (JWT)

Maven 最新版 项目构建与依赖管理

数据库与运维

• 数据库: MySQL 8.0+

• 容器化: Docker (可选)

• Web服务器: Nginx (可选，用于反向代理)

• 版本控制: Git

🚀 快速开始

环境准备

确保您的开发环境已安装以下必要组件：

软件 版本要求 下载/检查命令

Node.js >= 16.x node --version

Java 17+ java --version

MySQL 8.0+ mysql --version

Git 最新版 git --version

后端启动步骤

1. 克隆项目并进入后端目录
   git clone <项目地址>
   cd personal-blog/backend
   

2. 配置数据库连接
   编辑 src/main/resources/application.yml 文件：
   spring:
     datasource:
       url: jdbc:mysql://localhost:3306/blog_db?useSSL=false
       username: root
       password: your_password
       driver-class-name: com.mysql.cj.jdbc.Driver
   

3. 启动后端服务
   # 使用 Maven Wrapper
   ./mvnw spring-boot:run
   
   # 或使用 Maven
   mvn spring-boot:run
   

   ✅ 启动成功后，访问：http://localhost:8080

前端启动步骤

1. 进入前端目录
   cd ../frontend
   

2. 安装依赖包
   npm install
   # 或使用 yarn
   yarn install
   

3. 配置环境变量
   创建 .env.development 文件：
   VITE_API_BASE_URL=http://localhost:8080/api
   

4. 启动开发服务器
   npm run dev
   # 或使用 yarn
   yarn dev
   

   ✅ 启动成功后，访问：http://localhost:5173





📈 开发路线图

已完成功能

• ✅ 用户注册与登录 (JWT)

• ✅ 文章发布与管理

• ✅ 文章分类与标签

• ✅ 响应式前端界面

• ✅ RESTful API 设计

规划功能

• 🔄 文章评论系统

• 🔄 文章搜索功能

• 🔄 数据统计分析

• 🔄 Markdown 编辑器优化

• 🔄 多主题切换

欢迎任何形式的贡献！

📄 开源协议

本项目基于 MIT 协议 开源 - 查看 LICENSE 文件了解详情。

📞 联系方式

• 邮件联系: 1433743531@qq.com

⭐ 支持项目

如果这个项目对您有帮助，欢迎：

1. Star ⭐ 这个仓库
2. 分享给您的朋友和同事
3. 提出宝贵的意见和建议

感谢您的使用与支持！ 🎉

技术永不止步，代码改变世界。  

—— 让每一行代码都有价值，让每一次分享都有意义。

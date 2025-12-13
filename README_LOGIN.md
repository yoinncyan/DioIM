# Telegram 风格登录注册系统

一个使用 Flutter 开发的现代化登录注册应用，采用 Telegram 风格设计。

## ✨ 功能特点

- 🎨 Telegram 风格的现代化 UI 设计
- 🔐 完整的用户认证流程（登录、注册）
- ✅ 实时表单验证
- 📱 响应式设计，支持多种设备
- 🔄 完善的错误处理和用户反馈
- 💪 密码强度检测

## 📁 项目结构

```
lib/
├── main.dart                    # 应用入口，配置路由和主题
├── models/
│   └── user_model.dart         # 用户数据模型
├── services/
│   └── api_service.dart        # API 服务层（Dio）
├── utils/
│   ├── constants.dart          # 常量定义（颜色、API 等）
│   └── validators.dart         # 表单验证器
└── pages/
    ├── login_page.dart         # 登录页面
    ├── register_page.dart      # 注册页面
    └── success_page.dart       # 成功页面
```

## 🚀 快速开始

### 1. 安装依赖

```bash
cd flutter_application_1
flutter pub get
```

### 2. 启动后端服务器

确保后端服务器运行在 `http://localhost:8082`

```bash
# 进入后端目录
cd ../yoinncyan-DioImBackend_0001

# 启动 Go 后端服务器
go run main.go
```

### 3. 运行应用

```bash
# 运行在连接的设备或模拟器上
flutter run

# 或者指定设备
flutter run -d chrome        # 在浏览器中运行
flutter run -d macos         # 在 macOS 上运行
flutter run -d ios           # 在 iOS 模拟器中运行
```

## 🎯 使用流程

1. **启动应用** - 默认显示登录页面
2. **注册新用户**
   - 点击"立即注册"按钮
   - 填写用户名（至少3个字符）
   - 填写密码（至少6个字符，会显示强度提示）
   - 确认密码
   - 填写11位手机号
   - 填写邮箱地址
   - 点击"注册"按钮
3. **登录**
   - 在登录页面输入用户名和密码
   - 点击"登录"按钮
4. **成功页面** - 登录或注册成功后显示欢迎信息

## 🔌 API 接口

### 注册接口
- **方法**: GET
- **路径**: `/user/create`
- **参数**: 
  - `name`: 用户名
  - `password`: 密码
  - `phone`: 手机号
  - `email`: 邮箱

### 登录接口
- **方法**: POST
- **路径**: `/user/findUser`
- **参数** (Form Data):
  - `name`: 用户名
  - `password`: 密码

## 🎨 设计规范

- **主色调**: #0088CC (Telegram 蓝)
- **圆角**: 12px
- **按钮高度**: 50px
- **间距**: 16px / 24px
- **字体大小**: 标题 28px, 副标题 24px, 正文 16px

## 📋 表单验证规则

- ✅ 用户名：至少3个字符
- ✅ 密码：至少6个字符
- ✅ 手机号：11位数字，以1开头
- ✅ 邮箱：标准邮箱格式
- ✅ 确认密码：必须与密码一致

## 🛠️ 技术栈

- **框架**: Flutter 3.10.3+
- **HTTP 客户端**: Dio 5.4.0
- **状态管理**: StatefulWidget
- **设计风格**: Material Design + Telegram

## 📝 注意事项

1. 确保后端服务器在 `http://localhost:8082` 上运行
2. 如果使用真机测试，需要将 API 地址改为局域网 IP
3. 生产环境建议启用 HTTPS
4. 调试信息已注释，需要时可以取消注释

## 🐛 常见问题

### 无法连接到服务器
- 检查后端服务器是否运行
- 检查端口 8082 是否被占用
- 如果在真机上测试，确保手机和电脑在同一网络

### 依赖安装失败
```bash
flutter clean
flutter pub get
```

### 热重载不生效
```bash
# 使用热重启
r (在终端中)
# 或者重新运行
flutter run
```

## 📸 界面预览

- 登录页面：简洁的 Telegram 风格，带纸飞机图标
- 注册页面：完整的表单验证和密码强度提示
- 成功页面：显示欢迎信息和成功图标

## 🔄 后续改进建议

- [ ] 添加"记住我"功能
- [ ] 添加"忘记密码"功能
- [ ] 添加生物识别登录
- [ ] 添加社交媒体登录
- [ ] 添加国际化支持
- [ ] 添加暗黑模式


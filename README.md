## 📦 提交脚本指南（如何正确提交 PR）

欢迎贡献脚本！请按照以下规范提交你的 PR，以确保能够顺利通过自动校验并被收录。

---

### 🗂️ 1. 脚本目录结构

每个脚本应存放在以 **包名（Package Name）** 命名的文件夹下，例如：

```
scripts/
├── com.example.app/
│   └── my_script.lua
├── com.test.other/
│   └── another_script.lua
```

> ❗注意：文件夹名必须是 **该脚本对应的 App 包名**（如 `com.example.app`）。

---

### 📄 2. 脚本头部注释格式（必须！）

每个 `.lua` 脚本文件开头必须包含以下注释字段，格式如下：

```lua
-- name: 脚本名称（必填）
-- descript: 简要描述脚本功能（必填）
-- package: 对应的 App 包名（必填，必须与文件夹名一致）
-- author: 脚本作者昵称或 ID（必填）
```

#### ✅ 正确示例：

```lua
-- name: 一键登录助手
-- descript: 自动点击登录按钮
-- package: com.example.app
-- author: yourname

print("运行成功！")
```

#### ❌ 错误示例：

```lua
-- name=少了冒号
-- 描述: 格式不正确
```

> 🛑 未填写或格式错误将导致 PR 无法通过自动校验。

---

### 🧪 3. 自动校验与合并机制

我们使用 GitHub Actions 自动检查 PR 是否符合以下条件：

✅ 脚本放在正确路径（`scripts/com.package.name/your_script.lua`）
✅ 文件头部包含所有四个必填字段（name、descript、package、author）
✅ package 字段必须和文件夹名一致

---

### 🚀 4. PR 提交流程

1. **Fork 本仓库**
2. 在 `scripts/` 目录下添加你的包名文件夹和 `.lua` 脚本
3. 确保头部注释格式正确
4. 提交并发起 PR（Pull Request）到 `main` 分支
5. 等待自动校验通过（Actions 页面可查看结果）
6. 审核通过后我们将合并你的脚本

---

### 🙋 常见问题 FAQ

* **Q:** 我的脚本校验失败了怎么办？
  **A:** 请检查是否缺少 `-- name:` 或其他注释字段，或者格式不正确（冒号、缩进等）。

* **Q:** 我想更新自己以前提交过的脚本怎么办？
  **A:** 直接修改你之前的 `.lua` 文件并提交新的 PR 即可。

---

### ❤️ 感谢贡献！

感谢你对本项目的支持与贡献，我们期待与你共同打造更好的脚本平台！



# PS2EXE-GUI-
PowerShell GUI（用于调用 ps2exe.ps1 实现 PS1 转 EXE）的脚本
# PowerShell 脚本转 EXE GUI 工具

本项目提供一个 Windows GUI 工具，使用 PowerShell 编写，实现将 .ps1 脚本转为 .exe 文件（依赖 [ps2exe.ps1](https://github.com/MScholtes/PS2EXE)）。  
界面支持选择输入脚本、输出 EXE、图标、版本信息及转换选项等参数。

## 快速开始

1. **新建仓库**  
   在 GitHub 新建一个仓库（建议名：`ps1-to-exe-gui`），并上传本脚本和 `ps2exe.ps1` 工具。

2. **文件结构建议**
   ```
   ps1-to-exe-gui/
   ├── GUIPS1.ps1        # 主GUI脚本
   ├── ps2exe.ps1        # PS1转EXE脚本（需下载）
   └── README.md         # 项目说明
   ```

3. **运行方法**
   - 安装 PowerShell 5.1+
   - 下载仓库文件，双击运行 `GUIPS1.ps1`
   - 按提示选择脚本、参数，一键转换

4. **依赖**
   - Windows PowerShell
   - ps2exe.ps1（[官方下载](https://github.com/MScholtes/PS2EXE)）

## 仓库创建方法

### GitHub 网页操作
1. 登录 [GitHub](https://github.com/)
2. 点击右上角 “+” → “New repository”
3. 填写仓库名（如 `ps1-to-exe-gui`），设置为 Public 或 Private
4. 创建后，上传上述脚本文件

### Git 命令行操作
```bash
git init
git add GUIPS1.ps1 ps2exe.ps1 README.md
git commit -m "PowerShell GUI for PS1 to EXE conversion"
git remote add origin https://github.com/<你的用户名>/ps1-to-exe-gui.git
git push -u origin master
```

## 贡献方式

欢迎提交 issue、pull request 来优化功能或文档。

## License

建议使用 MIT 许可证。

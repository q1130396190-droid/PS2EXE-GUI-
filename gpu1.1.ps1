Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# 创建主窗口
$form = New-Object System.Windows.Forms.Form
$form.Text = "PS2EXE 转换器"
$form.Size = New-Object System.Drawing.Size(600, 650)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# 创建滚动面板（容纳所有控件）
$panel = New-Object System.Windows.Forms.Panel
$panel.Dock = "Fill"
$panel.AutoScroll = $true
$form.Controls.Add($panel)

# 标题标签
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "PowerShell 脚本转 EXE 工具"
$titleLabel.Font = New-Object System.Drawing.Font("微软雅黑", 12, [System.Drawing.FontStyle]::Bold)
$titleLabel.Location = New-Object System.Drawing.Point(20, 10)
$titleLabel.Size = New-Object System.Drawing.Size(540, 30)
$panel.Controls.Add($titleLabel)

# 输入文件选择
$inputLabel = New-Object System.Windows.Forms.Label
$inputLabel.Text = "源脚本文件 (.ps1):"
$inputLabel.Location = New-Object System.Drawing.Point(20, 50)
$inputLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($inputLabel)

$inputTextBox = New-Object System.Windows.Forms.TextBox
$inputTextBox.Location = New-Object System.Drawing.Point(180, 50)
$inputTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($inputTextBox)

$inputButton = New-Object System.Windows.Forms.Button
$inputButton.Text = "浏览..."
$inputButton.Location = New-Object System.Drawing.Point(490, 50)
$inputButton.Size = New-Object System.Drawing.Size(70, 23)
$inputButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "PowerShell 脚本 (*.ps1)|*.ps1|所有文件 (*.*)|*.*"
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $inputTextBox.Text = $dialog.FileName
        # 自动填充输出路径
        if ([string]::IsNullOrEmpty($outputTextBox.Text)) {
            $outputTextBox.Text = [System.IO.Path]::ChangeExtension($dialog.FileName, ".exe")
        }
    }
})
$panel.Controls.Add($inputButton)

# 输出文件选择
$outputLabel = New-Object System.Windows.Forms.Label
$outputLabel.Text = "输出 EXE 文件 (.exe):"
$outputLabel.Location = New-Object System.Drawing.Point(20, 80)
$outputLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($outputLabel)

$outputTextBox = New-Object System.Windows.Forms.TextBox
$outputTextBox.Location = New-Object System.Drawing.Point(180, 80)
$outputTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($outputTextBox)

$outputButton = New-Object System.Windows.Forms.Button
$outputButton.Text = "浏览..."
$outputButton.Location = New-Object System.Drawing.Point(490, 80)
$outputButton.Size = New-Object System.Drawing.Size(70, 23)
$outputButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.SaveFileDialog
    $dialog.Filter = "可执行文件 (*.exe)|*.exe|所有文件 (*.*)|*.*"
    if (![string]::IsNullOrEmpty($inputTextBox.Text)) {
        $dialog.FileName = [System.IO.Path]::ChangeExtension($inputTextBox.Text, ".exe")
    }
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $outputTextBox.Text = $dialog.FileName
    }
})
$panel.Controls.Add($outputButton)

# 图标文件选择
$iconLabel = New-Object System.Windows.Forms.Label
$iconLabel.Text = "图标文件 (.ico):"
$iconLabel.Location = New-Object System.Drawing.Point(20, 110)
$iconLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($iconLabel)

$iconTextBox = New-Object System.Windows.Forms.TextBox
$iconTextBox.Location = New-Object System.Drawing.Point(180, 110)
$iconTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($iconTextBox)

$iconButton = New-Object System.Windows.Forms.Button
$iconButton.Text = "浏览..."
$iconButton.Location = New-Object System.Drawing.Point(490, 110)
$iconButton.Size = New-Object System.Drawing.Size(70, 23)
$iconButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "图标文件 (*.ico)|*.ico|所有文件 (*.*)|*.*"
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $iconTextBox.Text = $dialog.FileName
    }
})
$panel.Controls.Add($iconButton)

# 版本信息分组
$versionGroup = New-Object System.Windows.Forms.GroupBox
$versionGroup.Text = "版本信息"
$versionGroup.Location = New-Object System.Drawing.Point(20, 140)
$versionGroup.Size = New-Object System.Drawing.Size(540, 150)
$panel.Controls.Add($versionGroup)

# 标题
$titleLabel2 = New-Object System.Windows.Forms.Label
$titleLabel2.Text = "标题:"
$titleLabel2.Location = New-Object System.Drawing.Point(20, 25)
$titleLabel2.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($titleLabel2)

$titleTextBox = New-Object System.Windows.Forms.TextBox
$titleTextBox.Location = New-Object System.Drawing.Point(110, 25)
$titleTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($titleTextBox)

# 产品名称
$productLabel = New-Object System.Windows.Forms.Label
$productLabel.Text = "产品名称:"
$productLabel.Location = New-Object System.Drawing.Point(20, 50)
$productLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($productLabel)

$productTextBox = New-Object System.Windows.Forms.TextBox
$productTextBox.Location = New-Object System.Drawing.Point(110, 50)
$productTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($productTextBox)

# 版权信息
$copyrightLabel = New-Object System.Windows.Forms.Label
$copyrightLabel.Text = "版权信息:"
$copyrightLabel.Location = New-Object System.Drawing.Point(20, 75)
$copyrightLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($copyrightLabel)

$copyrightTextBox = New-Object System.Windows.Forms.TextBox
$copyrightTextBox.Location = New-Object System.Drawing.Point(110, 75)
$copyrightTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($copyrightTextBox)

# 版本号
$versionLabel = New-Object System.Windows.Forms.Label
$versionLabel.Text = "版本号:"
$versionLabel.Location = New-Object System.Drawing.Point(20, 100)
$versionLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($versionLabel)

$versionTextBox = New-Object System.Windows.Forms.TextBox
$versionTextBox.Location = New-Object System.Drawing.Point(110, 100)
$versionTextBox.Size = New-Object System.Drawing.Size(150, 20)
$versionTextBox.Text = "1.0.0.0"
$versionGroup.Controls.Add($versionTextBox)

# 选项分组
$optionsGroup = New-Object System.Windows.Forms.GroupBox
$optionsGroup.Text = "转换选项"
$optionsGroup.Location = New-Object System.Drawing.Point(20, 300)
$optionsGroup.Size = New-Object System.Drawing.Size(540, 200)
$panel.Controls.Add($optionsGroup)

# 无控制台模式
$noConsoleCheckBox = New-Object System.Windows.Forms.CheckBox
$noConsoleCheckBox.Text = "无控制台窗口 (GUI 应用)"
$noConsoleCheckBox.Location = New-Object System.Drawing.Point(20, 25)
$noConsoleCheckBox.Size = New-Object System.Drawing.Size(200, 20)
$optionsGroup.Controls.Add($noConsoleCheckBox)

# 管理员权限
$adminCheckBox = New-Object System.Windows.Forms.CheckBox
$adminCheckBox.Text = "需要管理员权限"
$adminCheckBox.Location = New-Object System.Drawing.Point(20, 50)
$adminCheckBox.Size = New-Object System.Drawing.Size(200, 20)
$optionsGroup.Controls.Add($adminCheckBox)

# 32位/64位选择
$x86CheckBox = New-Object System.Windows.Forms.CheckBox
$x86CheckBox.Text = "32位运行"
$x86CheckBox.Location = New-Object System.Drawing.Point(20, 75)
$x86CheckBox.Size = New-Object System.Drawing.Size(100, 20)
$optionsGroup.Controls.Add($x86CheckBox)

$x64CheckBox = New-Object System.Windows.Forms.CheckBox
$x64CheckBox.Text = "64位运行"
$x64CheckBox.Location = New-Object System.Drawing.Point(130, 75)
$x64CheckBox.Size = New-Object System.Drawing.Size(100, 20)
$optionsGroup.Controls.Add($x64CheckBox)

# .NET 版本选择
$runtimeLabel = New-Object System.Windows.Forms.Label
$runtimeLabel.Text = ".NET 版本:"
$runtimeLabel.Location = New-Object System.Drawing.Point(20, 100)
$runtimeLabel.Size = New-Object System.Drawing.Size(80, 20)
$optionsGroup.Controls.Add($runtimeLabel)

$runtimeCombo = New-Object System.Windows.Forms.ComboBox
$runtimeCombo.Location = New-Object System.Drawing.Point(110, 100)
$runtimeCombo.Size = New-Object System.Drawing.Size(150, 21)
$runtimeCombo.Items.AddRange(@(".NET 2.0/3.x", ".NET 4.x"))
$runtimeCombo.SelectedIndex = 1
$optionsGroup.Controls.Add($runtimeCombo)

# 转换按钮
$convertButton = New-Object System.Windows.Forms.Button
$convertButton.Text = "开始转换"
$convertButton.Location = New-Object System.Drawing.Point(200, 520)
$convertButton.Size = New-Object System.Drawing.Size(100, 30)
$convertButton.Font = New-Object System.Drawing.Font("微软雅黑", 9, [System.Drawing.FontStyle]::Bold)
$convertButton.Add_Click({
    # 验证输入
    if ([string]::IsNullOrEmpty($inputTextBox.Text) -or !(Test-Path $inputTextBox.Text -PathType Leaf)) {
        [System.Windows.Forms.MessageBox]::Show("请选择有效来源脚本文件", "错误", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    if ([string]::IsNullOrEmpty($outputTextBox.Text)) {
        [System.Windows.Forms.MessageBox]::Show("请指定输出文件路径", "错误", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    # 构建参数
    $arguments = @(
        "-inputFile", "`"$($inputTextBox.Text)`"",
        "-outputFile", "`"$($outputTextBox.Text)`""
    )

    # 图标文件
    if (![string]::IsNullOrEmpty($iconTextBox.Text) -and (Test-Path $iconTextBox.Text -PathType Leaf)) {
        $arguments += "-iconFile", "`"$($iconTextBox.Text)`""
    }

    # 版本信息
    if (![string]::IsNullOrEmpty($titleTextBox.Text)) { $arguments += "-title", "`"$($titleTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($productTextBox.Text)) { $arguments += "-product", "`"$($productTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($copyrightTextBox.Text)) { $arguments += "-copyright", "`"$($copyrightTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($versionTextBox.Text)) { $arguments += "-version", "`"$($versionTextBox.Text)`"" }

    # 转换选项
    if ($noConsoleCheckBox.Checked) { $arguments += "-noConsole" }
    if ($adminCheckBox.Checked) { $arguments += "-requireAdmin" }
    if ($x86CheckBox.Checked) { $arguments += "-x86" }
    if ($x64CheckBox.Checked) { $arguments += "-x64" }
    if ($runtimeCombo.SelectedIndex -eq 0) { $arguments += "-runtime20" }
    else { $arguments += "-runtime40" }

    # 执行转换
    try {
        $process = New-Object System.Diagnostics.Process
        $process.StartInfo.FileName = "powershell.exe"
        $process.StartInfo.Arguments = "-ExecutionPolicy Bypass -File `"$PSScriptRoot\ps2exe.ps1`" $($arguments -join ' ')"
        $process.StartInfo.UseShellExecute = $false
        $process.StartInfo.RedirectStandardOutput = $true
        $process.StartInfo.RedirectStandardError = $true
        $process.Start() | Out-Null
        $output = $process.StandardOutput.ReadToEnd()
        $error = $process.StandardError.ReadToEnd()
        $process.WaitForExit()

        if ($process.ExitCode -eq 0) {
            [System.Windows.Forms.MessageBox]::Show("转换成功！`n输出文件: $($outputTextBox.Text)", "成功", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        }
        else {
            [System.Windows.Forms.MessageBox]::Show("转换失败: $error`n$output", "错误", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show("执行错误: $_", "错误", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})
$panel.Controls.Add($convertButton)

# 取消按钮
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "取消"
$cancelButton.Location = New-Object System.Drawing.Point(320, 520)
$cancelButton.Size = New-Object System.Drawing.Size(100, 30)
$cancelButton.Add_Click({ $form.Close() })
$panel.Controls.Add($cancelButton)

# 新增：访问项目主页按钮（位于取消按钮下方）
$linkButton = New-Object System.Windows.Forms.Button
$linkButton.Text = "访问项目主页"
$linkButton.Location = New-Object System.Drawing.Point(20, 580)  # 合理布局位置，避免遮挡
$linkButton.Size = New-Object System.Drawing.Size(150, 30)
$linkButton.Add_Click({
    # 点击后通过默认浏览器打开项目主页
    Start-Process "https://github.com/q1130396190-droid/PS2EXE-GUI-Simplified-Chinese"
})
$panel.Controls.Add($linkButton)

# 显示窗口
$form.ShowDialog() | Out-Null
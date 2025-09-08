Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ����������
$form = New-Object System.Windows.Forms.Form
$form.Text = "PS2EXE ת����"
$form.Size = New-Object System.Drawing.Size(600, 650)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# �����������
$panel = New-Object System.Windows.Forms.Panel
$panel.Dock = "Fill"
$panel.AutoScroll = $true
$form.Controls.Add($panel)

# �����ǩ
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "PowerShell �ű�ת EXE ����"
$titleLabel.Font = New-Object System.Drawing.Font("΢���ź�", 12, [System.Drawing.FontStyle]::Bold)
$titleLabel.Location = New-Object System.Drawing.Point(20, 10)
$titleLabel.Size = New-Object System.Drawing.Size(540, 30)
$panel.Controls.Add($titleLabel)

# �����ļ�ѡ��
$inputLabel = New-Object System.Windows.Forms.Label
$inputLabel.Text = "����ű��ļ� (.ps1):"
$inputLabel.Location = New-Object System.Drawing.Point(20, 50)
$inputLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($inputLabel)

$inputTextBox = New-Object System.Windows.Forms.TextBox
$inputTextBox.Location = New-Object System.Drawing.Point(180, 50)
$inputTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($inputTextBox)

$inputButton = New-Object System.Windows.Forms.Button
$inputButton.Text = "���..."
$inputButton.Location = New-Object System.Drawing.Point(490, 50)
$inputButton.Size = New-Object System.Drawing.Size(70, 23)
$inputButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "PowerShell �ű� (*.ps1)|*.ps1|�����ļ� (*.*)|*.*"
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $inputTextBox.Text = $dialog.FileName
        # �Զ�������·��
        if ([string]::IsNullOrEmpty($outputTextBox.Text)) {
            $outputTextBox.Text = [System.IO.Path]::ChangeExtension($dialog.FileName, ".exe")
        }
    }
})
$panel.Controls.Add($inputButton)

# ����ļ�ѡ��
$outputLabel = New-Object System.Windows.Forms.Label
$outputLabel.Text = "��� EXE �ļ� (.exe):"
$outputLabel.Location = New-Object System.Drawing.Point(20, 80)
$outputLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($outputLabel)

$outputTextBox = New-Object System.Windows.Forms.TextBox
$outputTextBox.Location = New-Object System.Drawing.Point(180, 80)
$outputTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($outputTextBox)

$outputButton = New-Object System.Windows.Forms.Button
$outputButton.Text = "���..."
$outputButton.Location = New-Object System.Drawing.Point(490, 80)
$outputButton.Size = New-Object System.Drawing.Size(70, 23)
$outputButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.SaveFileDialog
    $dialog.Filter = "��ִ���ļ� (*.exe)|*.exe|�����ļ� (*.*)|*.*"
    if (![string]::IsNullOrEmpty($inputTextBox.Text)) {
        $dialog.FileName = [System.IO.Path]::ChangeExtension($inputTextBox.Text, ".exe")
    }
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $outputTextBox.Text = $dialog.FileName
    }
})
$panel.Controls.Add($outputButton)

# ͼ���ļ�ѡ��
$iconLabel = New-Object System.Windows.Forms.Label
$iconLabel.Text = "ͼ���ļ� (.ico):"
$iconLabel.Location = New-Object System.Drawing.Point(20, 110)
$iconLabel.Size = New-Object System.Drawing.Size(150, 20)
$panel.Controls.Add($iconLabel)

$iconTextBox = New-Object System.Windows.Forms.TextBox
$iconTextBox.Location = New-Object System.Drawing.Point(180, 110)
$iconTextBox.Size = New-Object System.Drawing.Size(300, 20)
$panel.Controls.Add($iconTextBox)

$iconButton = New-Object System.Windows.Forms.Button
$iconButton.Text = "���..."
$iconButton.Location = New-Object System.Drawing.Point(490, 110)
$iconButton.Size = New-Object System.Drawing.Size(70, 23)
$iconButton.Add_Click({
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "ͼ���ļ� (*.ico)|*.ico|�����ļ� (*.*)|*.*"
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $iconTextBox.Text = $dialog.FileName
    }
})
$panel.Controls.Add($iconButton)

# �汾��Ϣ����
$versionGroup = New-Object System.Windows.Forms.GroupBox
$versionGroup.Text = "�汾��Ϣ"
$versionGroup.Location = New-Object System.Drawing.Point(20, 140)
$versionGroup.Size = New-Object System.Drawing.Size(540, 150)
$panel.Controls.Add($versionGroup)

# ����
$titleLabel2 = New-Object System.Windows.Forms.Label
$titleLabel2.Text = "����:"
$titleLabel2.Location = New-Object System.Drawing.Point(20, 25)
$titleLabel2.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($titleLabel2)

$titleTextBox = New-Object System.Windows.Forms.TextBox
$titleTextBox.Location = New-Object System.Drawing.Point(110, 25)
$titleTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($titleTextBox)

# ��Ʒ����
$productLabel = New-Object System.Windows.Forms.Label
$productLabel.Text = "��Ʒ����:"
$productLabel.Location = New-Object System.Drawing.Point(20, 50)
$productLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($productLabel)

$productTextBox = New-Object System.Windows.Forms.TextBox
$productTextBox.Location = New-Object System.Drawing.Point(110, 50)
$productTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($productTextBox)

# ��Ȩ��Ϣ
$copyrightLabel = New-Object System.Windows.Forms.Label
$copyrightLabel.Text = "��Ȩ��Ϣ:"
$copyrightLabel.Location = New-Object System.Drawing.Point(20, 75)
$copyrightLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($copyrightLabel)

$copyrightTextBox = New-Object System.Windows.Forms.TextBox
$copyrightTextBox.Location = New-Object System.Drawing.Point(110, 75)
$copyrightTextBox.Size = New-Object System.Drawing.Size(390, 20)
$versionGroup.Controls.Add($copyrightTextBox)

# �汾��
$versionLabel = New-Object System.Windows.Forms.Label
$versionLabel.Text = "�汾��:"
$versionLabel.Location = New-Object System.Drawing.Point(20, 100)
$versionLabel.Size = New-Object System.Drawing.Size(80, 20)
$versionGroup.Controls.Add($versionLabel)

$versionTextBox = New-Object System.Windows.Forms.TextBox
$versionTextBox.Location = New-Object System.Drawing.Point(110, 100)
$versionTextBox.Size = New-Object System.Drawing.Size(150, 20)
$versionTextBox.Text = "1.0.0.0"
$versionGroup.Controls.Add($versionTextBox)

# ѡ�����
$optionsGroup = New-Object System.Windows.Forms.GroupBox
$optionsGroup.Text = "ת��ѡ��"
$optionsGroup.Location = New-Object System.Drawing.Point(20, 300)
$optionsGroup.Size = New-Object System.Drawing.Size(540, 200)
$panel.Controls.Add($optionsGroup)

# �޿���̨ģʽ
$noConsoleCheckBox = New-Object System.Windows.Forms.CheckBox
$noConsoleCheckBox.Text = "�޿���̨���� (GUI Ӧ��)"
$noConsoleCheckBox.Location = New-Object System.Drawing.Point(20, 25)
$noConsoleCheckBox.Size = New-Object System.Drawing.Size(200, 20)
$optionsGroup.Controls.Add($noConsoleCheckBox)

# ����ԱȨ��
$adminCheckBox = New-Object System.Windows.Forms.CheckBox
$adminCheckBox.Text = "��Ҫ����ԱȨ��"
$adminCheckBox.Location = New-Object System.Drawing.Point(20, 50)
$adminCheckBox.Size = New-Object System.Drawing.Size(200, 20)
$optionsGroup.Controls.Add($adminCheckBox)

# 32λ/64λѡ��
$x86CheckBox = New-Object System.Windows.Forms.CheckBox
$x86CheckBox.Text = "32λ����ʱ"
$x86CheckBox.Location = New-Object System.Drawing.Point(20, 75)
$x86CheckBox.Size = New-Object System.Drawing.Size(100, 20)
$optionsGroup.Controls.Add($x86CheckBox)

$x64CheckBox = New-Object System.Windows.Forms.CheckBox
$x64CheckBox.Text = "64λ����ʱ"
$x64CheckBox.Location = New-Object System.Drawing.Point(130, 75)
$x64CheckBox.Size = New-Object System.Drawing.Size(100, 20)
$optionsGroup.Controls.Add($x64CheckBox)

# .NET �汾ѡ��
$runtimeLabel = New-Object System.Windows.Forms.Label
$runtimeLabel.Text = ".NET �汾:"
$runtimeLabel.Location = New-Object System.Drawing.Point(20, 100)
$runtimeLabel.Size = New-Object System.Drawing.Size(80, 20)
$optionsGroup.Controls.Add($runtimeLabel)

$runtimeCombo = New-Object System.Windows.Forms.ComboBox
$runtimeCombo.Location = New-Object System.Drawing.Point(110, 100)
$runtimeCombo.Size = New-Object System.Drawing.Size(150, 21)
$runtimeCombo.Items.AddRange(@(".NET 2.0/3.x", ".NET 4.x"))
$runtimeCombo.SelectedIndex = 1
$optionsGroup.Controls.Add($runtimeCombo)

# ת����ť
$convertButton = New-Object System.Windows.Forms.Button
$convertButton.Text = "��ʼת��"
$convertButton.Location = New-Object System.Drawing.Point(200, 520)
$convertButton.Size = New-Object System.Drawing.Size(100, 30)
$convertButton.Font = New-Object System.Drawing.Font("΢���ź�", 9, [System.Drawing.FontStyle]::Bold)
$convertButton.Add_Click({
    # ��֤����
    if ([string]::IsNullOrEmpty($inputTextBox.Text) -or !(Test-Path $inputTextBox.Text -PathType Leaf)) {
        [System.Windows.Forms.MessageBox]::Show("��ѡ����Ч������ű��ļ�", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    if ([string]::IsNullOrEmpty($outputTextBox.Text)) {
        [System.Windows.Forms.MessageBox]::Show("��ָ������ļ�·��", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    # ��������
    $arguments = @(
        "-inputFile", "`"$($inputTextBox.Text)`"",
        "-outputFile", "`"$($outputTextBox.Text)`""
    )

    # ͼ���ļ�
    if (![string]::IsNullOrEmpty($iconTextBox.Text) -and (Test-Path $iconTextBox.Text -PathType Leaf)) {
        $arguments += "-iconFile", "`"$($iconTextBox.Text)`""
    }

    # �汾��Ϣ
    if (![string]::IsNullOrEmpty($titleTextBox.Text)) { $arguments += "-title", "`"$($titleTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($productTextBox.Text)) { $arguments += "-product", "`"$($productTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($copyrightTextBox.Text)) { $arguments += "-copyright", "`"$($copyrightTextBox.Text)`"" }
    if (![string]::IsNullOrEmpty($versionTextBox.Text)) { $arguments += "-version", "`"$($versionTextBox.Text)`"" }

    # ѡ��
    if ($noConsoleCheckBox.Checked) { $arguments += "-noConsole" }
    if ($adminCheckBox.Checked) { $arguments += "-requireAdmin" }
    if ($x86CheckBox.Checked) { $arguments += "-x86" }
    if ($x64CheckBox.Checked) { $arguments += "-x64" }
    if ($runtimeCombo.SelectedIndex -eq 0) { $arguments += "-runtime20" }
    else { $arguments += "-runtime40" }

    # ִ��ת��
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
            [System.Windows.Forms.MessageBox]::Show("ת���ɹ���`n����ļ�: $($outputTextBox.Text)", "�ɹ�", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        }
        else {
            [System.Windows.Forms.MessageBox]::Show("ת��ʧ��: $error`n$output", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show("ִ�д���: $_", "����", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})
$panel.Controls.Add($convertButton)

# ȡ����ť
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "ȡ��"
$cancelButton.Location = New-Object System.Drawing.Point(320, 520)
$cancelButton.Size = New-Object System.Drawing.Size(100, 30)
$cancelButton.Add_Click({ $form.Close() })
$panel.Controls.Add($cancelButton)

# ��ʾ����
$form.ShowDialog() | Out-Null
function GetVSInfo {
    return & "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -Latest -format json | ConvertFrom-Json
}

oh-my-posh --init --shell pwsh --config "~/rickbutler.omp.json" | Invoke-Expression
Import-Module Terminal-Icons


if($IsWindows) {
    $VSInfo = GetVSInfo
    $VSInstallPath = $VSInfo | select-object -ExpandPropert installationPath
    $VSInstanceId = $VSInfo | select-object -ExpandPropert instanceId

    if($VSInstanceID -and $VSInstallPath) { 
        $DevShellPath = Get-ChildItem -Recurse -Path $VSInstallPath -Include Microsoft.VisualStudio.DevShell.dll | Select-Object -First 1
        Import-Module $DevShellPath
        Enter-VsDevShell $VSInstanceId
    }

    Import-Module posh-sshell   
}
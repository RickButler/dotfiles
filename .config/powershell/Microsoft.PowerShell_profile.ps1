function GetVSInfo {
    $path = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
    if(Test-Path $path) {
        return & $path -Latest -format json | ConvertFrom-Json
    } 
    return $false;    
}

oh-my-posh --init --shell pwsh --config "~/profile.omp.json" | Invoke-Expression
Import-Module Terminal-Icons

if($IsWindows) {
    $VSInfo = GetVSInfo
    if($VSInfo){        
        $VSInstallPath = $VSInfo | select-object -ExpandPropert installationPath
        $VSInstanceId = $VSInfo | select-object -ExpandPropert instanceId

        if($VSInstanceID -and $VSInstallPath) { 
            $DevShellPath = Get-ChildItem -Recurse -Path $VSInstallPath -Include Microsoft.VisualStudio.DevShell.dll | Select-Object -First 1
            Import-Module $DevShellPath
            Enter-VsDevShell $VSInstanceId
        }
    }

    Import-Module posh-git
}

Import-Module posh-sshell  

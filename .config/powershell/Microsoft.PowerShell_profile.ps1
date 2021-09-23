oh-my-posh --init --shell pwsh --config "~/rickbutler.omp.json" | Invoke-Expression

if($IsWindows) {
    Import-Module posh-git
    Import-Module posh-sshell
    Import-Module "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell d9b5e285
}

# dotfiles
These are my dot files, but mostly just my NeoVim setup.

# Setup
This doc assumes you are running Windows, most of the software used is in Linux through WSL. I use Ubuntu 20.04, but most of these steps should work on any debian based distro.
[I change my WSL home directory](https://superuser.com/questions/1132626/changing-home-directory-of-user-on-windows-subsystem-for-linux) to be the same as my windows home directory %USERPROFILE%. This isn't recommended, but it works and I like sharing config files, because of this you may need to fix some permissions on ```.ssh``` in WSL.

* Install [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install) 
* Install NeoVim >0.5 available in the [Unstable PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)
* [Install Latest LTS .Net](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)
* [Install Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7)
   * Change your personal folder to .config to match linux. I don't keep anything else there so works for me.
   * Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
* [FVIM](https://github.com/yatli/fvim) as vim gui in Windows
    * ```FVIM --wsl``` connects to NeoVim server in WSL
* [oh-my-posh](https://ohmyposh.dev/docs/linux)
   * I don't use the WSL specific version in WSL, I install the linux version.

# Font
* [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)

# Setting up NeoVim
#### In NeoVim use commands to install various language dependencies.
* DIInstall
* TSInstall
* LspInstall

# dotfiles
These are my dot files, but mostly just my NeoVim setup.

# Setup
This doc assumes you are running Windows, most of the software used is in Linux through WSL2. You can even [mix and match commands between WSL and Windows using aliases](https://docs.microsoft.com/en-us/windows/wsl/filesystems#interoperability-between-windows-and-linux-commands). I use Ubuntu 20.04 as my WSL distro, but most of these steps should work on any debian based distro.

[I also change my WSL home directory](https://superuser.com/questions/1132626/changing-home-directory-of-user-on-windows-subsystem-for-linux) to be the same as my windows home directory %USERPROFILE%. This isn't a recommended practice. If you choose to do this, it may be necessary to fix some permissions or [change how drives mount](https://www.turek.dev/posts/fix-wsl-file-permissions/) in WSL.

* Install [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install) 
* Install NeoVim >0.5 available in the [Unstable PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)
* [Install Latest LTS .Net](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)
* [Install Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7)
   * Change your personal folder to .config to match linux. I don't keep anything else there so works for me.
   * Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
* [FVIM](https://github.com/yatli/fvim) as an nvim gui for Windows. If you are on Window 11 [you may be able to run nvim-qt from WSL2](https://docs.microsoft.com/en-us/windows/wsl/tutorials/gui-apps).
    * ```FVIM --wsl``` connects to NeoVim server in WSL
* [oh-my-posh](https://ohmyposh.dev/docs/linux)
   * I don't use the WSL version. I follow the Windows and Linux installs.

# Font
* [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)

# VSCode
* (Install VSCode Server in WSL)[https://code.visualstudio.com/docs/remote/wsl]

# Setting up NeoVim
#### In NeoVim use commands to install various language dependencies.
* DIInstall
* TSInstall
* LspInstall

*** TODO: automate the installs for a language based on lang.lua config.

### Install Linux with WSL
- See all available distros `wsl --list --online`
- Install Linux Distro `wsl --install -d Ubuntu-22.04`
- See all your currently installed distros `wsl -l -v`
- Uninstall distro `wsl --unregister Ubuntu-22.04`



### Remove Linux Distro from WSL
Note. "Terminal must be access from administrator"
```
C:\Windows\System32>winget list ubuntu
Name   Id                    Version     Source
------------------------------------------------
Ubuntu Canonical.Ubuntu.2204 2204.2.33.0 winget

C:\Windows\System32>winget uninstall  Canonical.Ubuntu.2204
Found Ubuntu 22.04 LTS [Canonical.Ubuntu.2204]
Starting package uninstall...
  ██████████████████████████████  100%
Successfully uninstalled

C:\Windows\System32>
```

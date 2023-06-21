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

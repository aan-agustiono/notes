## Nested VM use Hardware resource
```
VBoxManage modifyvm <YourVirtualMachineName> --nested-hw-virt on  
```

## List VM name
```
ants@labs:~$ VBoxManage list vms  
```

## Example show info VM
```
ants@labs:~$ VBoxManage showvminfo proxmox
Name:                        proxmox
Encryption:                  disabled
Groups:                      /
Guest OS:                    Other/Unknown
UUID:                        528b372c-c975-4a43-aa03-3fe8edc722e4
Config file:                 /home/ants/VirtualBox VMs/proxmox/proxmox.vbox
Snapshot folder:             /home/ants/VirtualBox VMs/proxmox/Snapshots
Log folder:                  /home/ants/VirtualBox VMs/proxmox/Logs
Hardware UUID:               528b372c-c975-4a43-aa03-3fe8edc722e4
Memory size:                 5027MB
Page Fusion:                 disabled
VRAM size:                   9MB
CPU exec cap:                100%
HPET:                        disabled
CPUProfile:                  host
Chipset:                     piix3
Firmware:                    BIOS
Number of CPUs:              6
PAE:                         disabled
Long Mode:                   disabled
Triple Fault Reset:          disabled
APIC:                        enabled
X2APIC:                      disabled
Nested VT-x/AMD-V:           enabled
CPUID Portability Level:     0
CPUID overrides:             None
Boot menu mode:              message and menu
Boot Device 1:               Floppy
Boot Device 2:               DVD
Boot Device 3:               HardDisk
Boot Device 4:               Not Assigned
ACPI:                        enabled
IOAPIC:                      enabled
BIOS APIC mode:              APIC
Time offset:                 0ms
BIOS NVRAM File:             /home/ants/VirtualBox VMs/proxmox/proxmox.nvram
RTC:                         local time
Hardware Virtualization:     enabled
Nested Paging:               enabled
Large Pages:                 enabled
VT-x VPID:                   enabled
VT-x Unrestricted Exec.:     enabled
AMD-V Virt. Vmsave/Vmload:   enabled
IOMMU:                       None
Paravirt. Provider:          Default
Effective Paravirt. Prov.:   None
State:                       running (since 2024-05-31T08:45:29.897000000)
Graphics Controller:         VMSVGA
Monitor count:               1
3D Acceleration:             disabled
2D Video Acceleration:       disabled
Teleporter Enabled:          disabled
Teleporter Port:             0
Teleporter Address:
Teleporter Password:
Tracing Enabled:             disabled
Allow Tracing to Access VM:  disabled
Tracing Configuration:
Autostart Enabled:           disabled
Autostart Delay:             0
Default Frontend:
VM process priority:         default
Storage Controllers:
#0: 'IDE', Type: PIIX4, Instance: 0, Ports: 2 (max 2), Bootable
  Port 0, Unit 0: UUID: 841df4ca-bb91-4d8f-9964-af64d289ba5e
    Location: "/home/ants/VirtualBox VMs/proxmox/proxmox.vdi"
  Port 1, Unit 0: UUID: c5ab301c-113a-4eda-a426-5facea3126ac
    Location: "/home/ants/Downloads/ISO/proxmox-ve_8.0-2.iso"
NIC 1:                       MAC: 08002716C16D, Attachment: Bridged Interface 'enx00ea4c6e330b', Cable connected: on, Trace: off (file: none), Type: Am79C973, Reported speed: 0 Mbps, Boot priority: 0, Promisc Policy: deny, Bandwidth group: none
NIC 2:                       disabled
NIC 3:                       disabled
NIC 4:                       disabled
NIC 5:                       disabled
NIC 6:                       disabled
NIC 7:                       disabled
NIC 8:                       disabled
Pointing Device:             PS/2 Mouse
Keyboard Device:             PS/2 Keyboard
UART 1:                      disabled
UART 2:                      disabled
UART 3:                      disabled
UART 4:                      disabled
LPT 1:                       disabled
LPT 2:                       disabled
Audio:                       enabled (Driver: Default, Controller: AC97, Codec: STAC9700)
Audio playback:              enabled
Audio capture:               disabled
Clipboard Mode:              disabled
Drag and drop Mode:          disabled
Session name:                GUI/Qt
Video mode:                  1024x768x32 at 0,0 enabled
VRDE:                        disabled
OHCI USB:                    enabled
EHCI USB:                    enabled
xHCI USB:                    disabled
USB Device Filters:          <none>
Available remote USB devices: <none>
Currently attached USB devices: <none>
Bandwidth groups:            <none>
Shared folders:              <none>
VRDE Connection:             not active
Clients so far:              0
Recording enabled:           no
Recording screens:           1
 Screen 0:
    Enabled:                 yes
    ID:                      0
    Record video:            yes
    Destination:             File
    File:                    /home/ants/VirtualBox VMs/proxmox/proxmox-screen0.webm
    Options:                 vc_enabled=true,ac_enabled=false,ac_profile=med
    Video dimensions:        1024x768
    Video rate:              512kbps
    Video FPS:               25fps
* Guest:
Configured memory balloon:   0MB
OS type:                     Other
Additions run level:         0
Guest Facilities:            <none>
```

<table>
  <tr>
    <th>Command</th>
    <th>Descriptions</th>
  </tr>
  <tr>
    <td><code># systemctl</code></td>
    <td>display a list of all loaded systemd units (read the systemd documentation for more information about systemd units) including services, showing their status (whether active or not).</td>
  </tr>
  <tr>
    <td><code># systemctl list-units --type=service</code><br>or<br> <code># systemctl --type=service</code></td>
    <td>list-units subcommand and --type switch with a value of service</td>
  </tr>
  <tr>
    <td><code># systemctl list-units --type=service --state=active</code><br>OR<br><code># systemctl --type=service --state=active</code></td>
    <td>list all loaded but active services</td>
  </tr>
  <tr>
    <td><code># systemctl list-units --type=service --state=running</code><br>OR<br><code># systemctl --type=service --state=running</code></td>
    <td>i.e. all loaded and actively running services</td>
  </tr>
</table>

#### example
```
ants@labs:~$ sudo systemctl list-units  --type=service  --state=running

  UNIT                        LOAD   ACTIVE SUB     DESCRIPTION
  accounts-daemon.service     loaded active running Accounts Service
  acpid.service               loaded active running ACPI event daemon
  avahi-daemon.service        loaded active running Avahi mDNS/DNS-SD Stack
  bluetooth.service           loaded active running Bluetooth service
  colord.service              loaded active running Manage, Install and Generate Color Profiles
  cron.service                loaded active running Regular background program processing daemon
  cups-browsed.service        loaded active running Make remote CUPS printers available locally
  cups.service                loaded active running CUPS Scheduler
  dbus.service                loaded active running D-Bus System Message Bus
  getty@tty1.service          loaded active running Getty on tty1
  irqbalance.service          loaded active running irqbalance daemon
```

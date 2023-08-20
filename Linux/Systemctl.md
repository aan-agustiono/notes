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
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>

If you frequently use the previous command, you can create an <code>alias</code> command in your <code>~/.bashrc</code> file as shown, to easily invoke it.
`# vim ~/.bashrc`
Then add the following line under the list of aliases as shown in the screenshot.
```
alias running_services='systemctl list-units  --type=service  --state=running'
```
example
```
```

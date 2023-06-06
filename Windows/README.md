<ul>
<li>command get license key windows : <code>wmic path softwarelicensingservice get OA3xOriginalProductKey</code></li>
<li>command get serial number di cmd : <code>wmic bios get serialnumber</code></li>
  <li>Powershell : <code>Get-WmiObject win32_bios | Format-List SerialNumber</code></li>
  <li>command prompt : <code>slmgr -dlv</code></li>
</ul>

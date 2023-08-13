#### Problem
Is it possible to install an older version of RouterOS on my device? What versions can be used?
___

#### Solution
Yes, you can downgrade RouterOS, but only until the factory installed version, which you can check with this command: 
___

```
/system/resource/print
 
uptime: 4w4d18h21m5s
            version: 6.49.6 (stable)
         build-time: Apr/07/2022 17:53:31
   factory-software: 6.45.9
The factory-software is the oldest version supported by this device.
```
___

#### Follow these steps to downgrade to an older version

- Make sure you have npk packages of the same architecture type as your device.
- Upload the older version npk files to the device with FTP, Webfig or Winbox.
- Issue the command line command `/system/package/downgrade`
- Issue the command `/system/reboot`

#### Source Reff
<a href="https://help.mikrotik.com/docs/display/RKB/Downgrading+RouterOS">Downgrading RouterOS</a>

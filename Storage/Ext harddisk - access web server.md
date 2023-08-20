https://askubuntu.com/questions/1220778/how-can-web-server-access-external-hdd

### Questions
"Instead of using a third-party media app like Kodi or Plex, I want to make a simple local website that can be accessed from any device in my network via a browser.

I have two external drives with all my media plugged into a PC running the web server stuff.

But I can't seem to figure out how to get the media to play in the browser from the external drives. As a test, I moved a file into the web server's directory and it worked, but it does not if i set the URL file path to point to an external drive outside the web server's directory.

Thanks in advance for any tips."

### Solutions
What you are trying to do the way you are doing it is not possible due to first inappropriate directory and file permissions and second the external HDD is out of the scope for the Apache web root directory.

However, you can achieve this by following these steps:

- Create a directory on the external HDD, assuming it is mounted under the /media directory, like so:
```
sudo mkdir /media/web_files
```
- Change the ownership of this directory and all the files under it to be owned by the Apache user www-data like so:
```
sudo chown -R www-data:www-data /media/web_files/
```
- Create a directory under the web root directory ie /var/www/html/ like so:
```
sudo mkdir /var/www/html/external_files
```
- Bind the <code>/media/web_files/</code> directory to the <code>/var/www/html/external_files/</code> directory like so:
```
sudo mount --bind /media/web_files/ /var/www/html/external_files/
```
- All files on the external HDD under the <code>/media/web_files/</code> directory will be available for Apache under the <code>/var/www/html/external_files/</code> directory and you can link to them in your web page that resides in <code>/var/www/html/</code> like so:
```
<a href="external_files/file1.mp4">file1</a>
```


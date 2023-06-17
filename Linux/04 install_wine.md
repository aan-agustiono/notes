Check installed architectures
- Verify 64-bit architecture. The following command should respond with "amd64".
<pre>$ dpkg --print-architecture</pre>

See if 32-bit architecture is installed. The following command should respond with "i386".

`$ dpkg --print-foreign-architectures`

If "i386" is not displayed, execute the following.

$ sudo dpkg --add-architecture i386

Recheck with.

$ dpkg --print-foreign-architectures

Download and add the WineHQ repository key
$ sudo mkdir -pm755 /etc/apt/keyrings
$ sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

Download the WineHQ sources file
$ sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

Update the package database
$ sudo apt update

Install Wine
The next command installs Wine Stable. To install Wine Development or Wine Staging, replace winehq-stable  by  winehq-devel or winehq-staging

After a major Wine upgrade (from Wine 6 to Wine 7, for example), Wine Stable may temporarily be unavailable, but Wine Development and Wine Staging can still be installed.

$ sudo apt install --install-recommends winehq-stable

Verify the installation succeeded
$ wine --version

Configure Wine
The default Wine configuration prepares Wine as a Windows 7 environment, which is good for some older Windows apps, but many contemporary apps will be better matched to Windows 8.1 or Windows 10. In addition, other configuration options may be significant.

To bring up Wine's configuration panel, open a Terminal window and execute winecfg. If installing mono or gecko is offered, accept the offer. When prompted, set your preferred version of Windows.

$ wine winecfg

If you are creating custom Wine prefixes, this configuration must be repeated for each prefix.

Two simple tests
Just for fun, or to see Wine in action …

Display a simple clock
$ wine clock

Run Wine's builtin web browser
If installing gecko is offered, accept the offer.

Lately, iexplore fails to run properly on some distributions. If the window that opens is solid black, click the Refresh button to obtain partial functionality. Scrolling does not work, but links and window resizing do.

$ wine iexplore



====================================================================
    Fix winbox fonts on wine linux
====================================================================
####  Install package mscorefont.
sudo apt-get install ttf-mscorefonts-installer

####  Kadang trik diatas bisa memperbaiki, tapi kalau tidak coba install winetrick dan install DLL riched2
sudo apt-get install winetricks
winetricks riched20

#### Nah,yang terakhir buat sebuah file dengan isi sebagai berikut:
[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"ClientSideWithRender"="N"

#### anda simpan dengan nama winbox.reg, setelah itu buka terminal dan jalankan perintah berikut:
regedit winbox.reg

Aplikasi winbox seharusnya sudah berjalan dengan baik.

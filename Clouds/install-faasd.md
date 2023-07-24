<i>Source <a href="https://willschenk.com/howto/2021/installing_faasd/">willschenk.com - installing_faasd</a></i>
## Install faasd
Ssh into your server as root and run the following commands:
<pre>
  export LETSENCRYPT_EMAIL=aan.agustiono@gmail.com     # Change to yours
  export FAASD_DOMAIN=faasd.infra.lab                  # Change to yours

  apt-get install -y git
  cd /tmp
  git clone https://github.com/openfaas/faasd --depth=1
  cd faasd

  ./hack/install.sh

  cat /var/lib/faasd/secrets/basic-auth-password
  echo
</pre>  
<p>The last line will print out the auth password which you will need for the ui and to use the cli.</p>

<p>We can run this on the remote server using:</p>
<pre>
ssh root@faasd.infra.lab < install.sh
</pre>                               
Just visit your domain to see the UI. The username is admin and the password was printed out by the previous command.

## Install faas-cli
<p>My server is faasd.infra.lab so lets first install the cli tool, and then point it to it.</p>
<pre>
  curl -sSL https://cli.openfaas.com | sudo sh
  export OPENFAAS_URL=https://faasd.infra.lab
  ssh root@faasd.infra.lab cat /var/lib/faasd/secrets/basic-auth-password | faas-cli login --username admin --password-stdin
</pre>


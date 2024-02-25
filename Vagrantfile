Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 8080, host: 8123

  config.vm.provision "shell", inline: <<-SHELL
    apt update

    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh ./get-docker.sh
    usermod -G docker -a vagrant

    (
      PLUGINS=/usr/local/lib/docker/cli-plugins
      URL="https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64"
      mkdir -p "$PLUGINS"
      curl -SL "$URL" -o "${PLUGINS}/docker-compose"
      chmod +x "${PLUGINS}/docker-compose"
    )

    wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip
    which unzip || apt install unzip
    unzip terraform_1.7.4_linux_amd64.zip
    mv terraform /usr/bin/

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
  SHELL
end

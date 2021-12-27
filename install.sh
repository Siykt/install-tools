defaultInstallNodeVersion="14.3"

useNvmInstallNode() {
  nvm install ${defaultInstallNodeVersion}
  nvn use ${defaultInstallNodeVersion}
}

if [[ $(uname) == 'Darwin' ]]; then
  echo "Mac OS"
fi

if [[ $(uname) == 'Linux' ]]; then
  # CentOS install
  git clone git://github.com/cnpm/nvm.git ~/.nvm && cd ~/.nvm && git checkout $(git describe --abbrev=0 --tags)
  echo ". ~/.nvm/nvm.sh" >>/etc/profile
  source /etc/profile
  useNvmInstallNode
fi

# v14.3兼容性
DEFAULT_INSTALL_NODE_VERSION="14.3"

use_nvm_install_node() {
  nvm install ${DEFAULT_INSTALL_NODE_VERSION}
  nvm use ${DEFAULT_INSTALL_NODE_VERSION}
}

program_not_exists() {
  local ret='0'
  command -v $1 >/dev/null 2>&1 || { local ret='1'; }
  # fail on non-zero return value
  if [ "$ret" -ne 0 ]; then
    return 0
  fi

  return 1
}

if program_not_exists git; then
  yum install git -y
fi

git clone git://github.com/cnpm/nvm.git ~/.nvm && cd ~/.nvm && git checkout $(git describe --abbrev=0 --tags)
echo ". ~/.nvm/nvm.sh" >>/etc/profile
source /etc/profile
use_nvm_install_node

if program_not_exists nginx; then
  yum -y install nginx
  systemctl enable nginx
  service nginx start
fi

# 安装 pm2
npm install pm2 -g

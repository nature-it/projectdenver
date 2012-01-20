# /etc/puppet/manifests/yum/init.pp
class yum::client {
  if ($operatingsystem == "RedHat") or ($operatingsystem == "CentOS") {
    case $lsbmajdistrelease {
      "4": { }
      default: {
        package { "yum": ensure => installed }
        include yum::repo::nature
      }
    }
  }
}

# Better method of managing the nature repo, migrate to this.
class yum::repo::nature {
  yumrepo { 'Nature':
    descr    => "NPG Packages for RHEL \$releasever",
    baseurl  => "http://puppet/rhel/5/x86_64/",
    enabled  => '1',
    gpgcheck => '0',
  }
}

class yum::client::epel {
  if ($operatingsystem == "RedHat") or ($operatingsystem == "CentOS") {
    package { "epel-release": ensure => installed }
  }
}

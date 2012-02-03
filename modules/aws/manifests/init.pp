#/etc/puppet/modules/aws/manifests/init.pp

class aws::sthree {
    package { "gcc-c++": ensure=>installed }
    package { "libcurl-devel": ensure=>installed }
    package { "libxml2-devel": ensure=>installed }
    package { "openssl-devel": ensure=>installed }

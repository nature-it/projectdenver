#/etc/puppet/modules/npgbase/manifests/scripts.pp

# Manage core NPG-wide scripts

class npgbase::scripts {
  $npgscriptdir="/usr/local/scripts"
  file { "${npgscriptdir}":
    ensure => directory,
    mode   => 0755,
    owner  => root,
    group  => root,
  }
}

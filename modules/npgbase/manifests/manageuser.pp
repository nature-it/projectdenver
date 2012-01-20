#/etc/puppet/modules/npgbase/manifests/users.pp

# Manage environment-wide NPG users

define npgbase::manageuser($gid='',$ensure=present) {
  if ($ensure == 'absent' and $name == 'root') {
    fail("Will not delete root user.")
  }
  if $gid {
    $group = $gid
  } else {
    $group = $name
  }

  $home = $name ? {
    'root'  => '/root',
    default => "/home/${name}",
  }

  user { $name:
    ensure => $ensure,
    gid    => $group,
    home   => $home,
  }

  case $ensure {
    absent: {
      file { $home: mode => 0000 }
    }
    present: {
      if ! defined (Group[$group]) {
        group { $group:
          ensure => $ensure,
        }
      }
      file { $home:
        ensure => directory,
        owner  => $name,
        group  => $group,
        mode   => 0700,
      }
    }
  }
}

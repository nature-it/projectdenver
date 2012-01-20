#modules/natureapps/manifests/fileserver.pp

# Covers the odds and ends we ask of our fileservers

class natureapps::fileserver {
  include nfs::server,proftpd::server
  file { "/home/npgmediasync/scripts":
    ensure => directory,
  }
  file { "netstorage-sync":
    path    => "/home/npgmediasync/scripts/netstorage-sync.sh",
    mode    => 755,
    source  => "puppet:///modules/natureapps/netstorage-sync.sh",
    require => File["/home/npgmediasync/scripts"],
  }
  cron { "netstorage-sync":
    command => "/home/npgmediasync/scripts/netstorage-sync.sh",
    user    => "npgmediasync",
    minute  => 0,
    require => File["netstorage-sync"],
    ensure  => absent,
  }
}

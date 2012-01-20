class natureapps::common::libraries {
}
class natureapps::common::filesystem {
	case $servergroup {
		'development': {
			file { "/mnt/fs":
				ensure => directory,
				owner  => xb3,
				group  => xb3,
			}
    }
		default: {
			case $servergroup {
				'live': { $nfshost="naturefs4" }
				'dr': { $nfshost="drfs" }
				'staging': { $nfshost="staging-fs" }
				'test': { $nfshost="test-fs" }
				default: { $nfshost="localhost" }
			}
			mount { "/mnt/fs":
				atboot  => true,
				fstype  => "nfs",
				device  => "$nfshost:/usr/fs",
				name    => "/mnt/fs",
				options => "rw,noatime,tcp,soft,intr,_netdev,nodiratime",
				require => Host["${nfshost}"],
			}
    }
  }
}

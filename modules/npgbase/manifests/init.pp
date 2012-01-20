#/etc/puppet/modules/npgbase/manifests/init.pp

# Ensure NPG specific configuration is always present
# This will consist of:
#  npgbase::scripts
#  npgbase::users
class npgbase {
  include npgbase::scripts, npgbase::users, motd
}

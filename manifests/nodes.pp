# site.pp for ec2 puppetmaster

node default {

  ## Stuff we always want
  #include npgbase::scripts, npgbase::users, npgbase::packages, ec2base, zenoss::client
  #include mcollective::client
  include yum::client,puppet,npgbase::scripts

  case $::npg_role {
    "web":  {
          include apacheserver::npgweb
          }
    "PD-JavaNode": {
          include apacheserver::npgweb, npgbase::users
          } 
    default: {
          # Role has not yet been defined... Should probably fire off a message/error since this is 
          # going to be a waste of money!
          notice("I have no npg_role defined.  Such a waste.")
          }
  }
}

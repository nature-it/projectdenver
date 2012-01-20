class npgbase::users {
  manageuser {
    ['smccool','mbadami','cwenny','olevenkov','sadams']:
      ensure => present,
  }

  manageuser {
    ['tlan']:
      ensure => absent,
  }
}

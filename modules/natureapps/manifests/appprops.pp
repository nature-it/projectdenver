define natureapps::appprops($basepath,$propfile,$owner) {
  file { "${basepath}/${propfile}":
    owner => $owner,
#    content => template("${propfile}.erb")
    ensure => file,
  }
}
    

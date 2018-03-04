class corp104_samba::install inherits corp104_samba {
  package { 'samba':
    ensure => $corp104_samba::package_ensure,
    name   => $corp104_samba::package_name,
  }
}

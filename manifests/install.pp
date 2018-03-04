class corp104_samba::install inherits corp104_samba {
  package { 'samba':
    ensure => $package_ensure,
    name   => $package_name,
  }
}

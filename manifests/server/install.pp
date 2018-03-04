class corp104_samba::server::install inherits corp104_samba::server {
  package { 'samba':
    ensure    => $package_ensure,
    name      => $package_name,
  }
}

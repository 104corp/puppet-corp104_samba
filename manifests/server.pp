class corp104_samba::server (
  String $package_ensure,
  String $package_name,
  String $service_ensure,
  Boolean $service_enable,
  String $service_name,
  String $smb_config,
  Boolean $nmbd_enable,
){
  contain corp104_samba::install
  contain corp104_samba::config
  contain corp104_samba::service

  Class['::corp104_samba::install']
  -> Class['::corp104_samba::config']
  ~> Class['::corp104_samba::service']
}

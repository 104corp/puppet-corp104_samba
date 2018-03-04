class corp104_samba::server (
  String $package_ensure,
  String $package_name,
  String $service_ensure,
  Boolean $service_enable,
  String $service_name,
  String $smb_config,
  Boolean $nmbd_enable,
  String $workgroup,
  String $server_string,
  Boolean $dns_proxy,
  Boolean $wins_support,
  Optional[String] $wins_server,
  Optional[String] $interface,
  Boolean $bind_interfaces_only,
  String $log_file,
  Integer $max_log_size,
  Boolean $syslog_only,
  String $syslog,
  String $panic_action,
  String $server_role,
  String $passdb_backend,
  Boolean $obey_pam_restrictions,
  Boolean $unix_password_sync,
  String $passwd_program,
  String $passwd_chat,
  Boolean $pam_password_change,
  String $map_to_guest,
  Optional[String] $logon_path,
  Optional[String] $logon_drive,
  Optional[String] $logon_home,
  Optional[String] $logon_script,
  Optional[String] $add_user_script,
  Optional[String] $add_machine_script,
  Optional[String] $add_group_script,
  Optional[String] $include,
  Optional[String] $idmap_uid,
  Optional[String] $idmap_gid,
  Optional[String] $template_shell,
  Optional[Integer] $usershare_max_shares,
  Boolean $usershare_allow_guests,
){
  contain corp104_samba::server::install
  contain corp104_samba::server::config
  contain corp104_samba::server::service

  Class['::corp104_samba::server::install']
  -> Class['::corp104_samba::server::config']
  ~> Class['::corp104_samba::server::service']
}

define corp104_samba::share (
  String $path = $name,
  Optional[String] $comment = undef,
  Boolean $browseable = true,
  Boolean $writable = true,
  Optional[String] $write_list = undef,
  Boolean $guest = false,
  Optional[String] $create_mask = undef,
  Optional[String] $directory_mask = undef,
  Boolean $read_only = false,
  Optional[String] $valid_users = undef,
  Optional[String] $force_user = undef,
  Optional[Array] $hosts_allow = undef,
  Optional[Array] $hosts_deny = undef,
) {
  concat::fragment { "${name}-samba-conf-share":
    target  => $corp104_samba::smb_config,
    order   => 90,
    content => template("${module_name}/config/smb_conf/share.erb"),
    require => Class['corp104_samba::config']
  }
}

class corp104_samba::config inherits corp104_samba {
  file { '/etc/samba':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  concat { $corp104_samba::smb_config:
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => [ File['/etc/samba'], Package['samba'] ],
    notify  => Class['corp104_samba::service'],
  }

  # Template uses:
  # - $workgroup
  # - $server_string
  concat::fragment { 'smb.conf-global':
    target  => $corp104_samba::smb_config,
    order   => 0,
    content => template("${module_name}/config/smb_conf/global.erb"),
  }

  # Template uses:
  # - $wins_support
  # - $wins_server
  concat::fragment { 'smb.conf-global-wins':
    target  => $corp104_samba::smb_config,
    order   => 10,
    content => template("${module_name}/config/smb_conf/global_wins.erb"),
  }

  # Template uses:
  # - $interfaces
  # - $bind_interfaces_only
  concat::fragment { 'smb.conf-global-networking':
    target  => $corp104_samba::smb_config,
    order   => 12,
    content => template("${module_name}/config/smb_conf/global_networking.erb"),
  }

  # Template uses:
  # - $log_file
  # - $max_log_size
  # - $syslog_only
  # - $syslog
  # - $panic_action
  concat::fragment { 'smb.conf-global-debugging':
    target  => $corp104_samba::smb_config,
    order   => 13,
    content => template("${module_name}/config/smb_conf/global_debugging.erb"),
  }

  # Template uses:
  # - $server_role
  # - $passdb_backend
  # - $obey_pam_restrictions
  # - $unix_password_sync
  # - $passwd_program
  # - $passwd_chat
  # - $pam_password_change
  # - $map_to_guest
  concat::fragment { 'smb.conf-global-authentication':
    target  => $corp104_samba::smb_config,
    order   => 14,
    content => template("${module_name}/config/smb_conf/global_authentication.erb"),
  }

  # Template uses:
  # - $logon_path
  # - $logon_drive
  # - $logon_home
  # - $logon_script
  # - $add_user_script
  # - $add_machine_script
  # - $add_group_script
  concat::fragment { 'smb.conf-global-domain':
    target  => $corp104_samba::smb_config,
    order   => 15,
    content => template("${module_name}/config/smb_conf/global_domain.erb"),
  }

  # Template uses:
  # - $include
  # - $idmap_uid
  # - $idmap_gid
  # - $template_shell
  # - $usershare_max_shares
  # - $usershare_allow_guests
  concat::fragment { 'smb.conf-global-misc':
    target  => $corp104_samba::smb_config,
    order   => 16,
    content => template("${module_name}/config/smb_conf/global_misc.erb"),
  }
}

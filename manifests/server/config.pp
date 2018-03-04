class corp104_samba::server::config inherits corp104_samba::server {
  augeas { 'smb.conf':
    incl => $smb_config,
    lens => 'Samba.lns',
    notify  => Service['corp104_samba']
  }
}

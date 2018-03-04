class corp104_samba::service inherits corp104_samba {
  service { 'samba':
    ensure    => $corp104_samba::service_ensure,
    enable    => $corp104_samba::service_enable,
    name      => $corp104_samba::service_name,
    subscribe => Package['samba'],
  }

  if $corp104_samba::nmbd_enable {
    service { 'nmbd':
      ensure    => running,
      enable    => true,
      name      => 'nmbd',
      subscribe => Package['samba'],
    }
  }
}

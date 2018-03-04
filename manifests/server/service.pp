class corp104_samba::server::service inherits corp104_samba::server {
  service { 'samba':
    ensure    => $corp104_samba::server::service_ensure,
    enable    => $corp104_samba::server::service_enable,
    name      => $corp104_samba::server::service_name,
    subscribe => Package['samba'],
  }

  if $corp104_samba::server::nmbd_enable {
    service { 'nmbd':
      ensure    => running,
      enable    => true,
      name      => 'nmbd',
      subscribe => Package['samba'],
    }
  }
}

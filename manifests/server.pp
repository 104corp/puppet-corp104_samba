class corp104_samba::server (
  String $package_ensure,
  String $package_name,
  String $service_ensure,
  Boolean $service_enable,
  String $service_name,
  String $smb_config,
){

  package { 'corp104_samba':
    ensure    => $package_ensure,
    name      => $package_name,
  }

  service { 'corp104_samba':
    ensure    => $service_ensure,
    enable    => $service_enable,
    name      => $service_name,
    subscribe => Package['corp104_samba'],
  }

  
  augeas { 'smb.conf':
    incl => $smb_config,
    lens => 'Samba.lns',
    notify  => Service['']
  }

}

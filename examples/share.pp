include corp104_samba

corp104_samba::share { 'share-sample':
  comment => 'This share sample',
  path => '/tmp',
  writable => true,
  browseable => true,
  create_mask => '0644',
  directory_mask => '0755',
  valid_users => 'smbuser',
  hosts_deny => ['All'],
  hosts_allow => ['192.168.0.2'],
}

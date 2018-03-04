require 'spec_helper_acceptance'

describe 'install corp104_samba' do
  context 'default parameters' do
    it 'should install package' do
      pp = "class { 'corp104_samba': }"

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'generate samba share' do
    it 'should install package' do
      pp = <<-EOS
        include corp104_samba

        corp104_samba::share { 'share-sample':
          comment        => 'This share sample',
          path           => '/tmp',
          writable       => true,
          browseable     => true,
          create_mask    => '0644',
          directory_mask => '0755',
          valid_users    => 'smbuser',
          hosts_deny     => ['All'],
          hosts_allow    => ['192.168.0.2'],
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end

require 'spec_helper_acceptance'

describe 'install corp104_backup' do
  context 'default parameters' do
    it 'should install package' do
      pp = "class { 'corp104_backup': }"

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'generate backup script' do
    it 'should install package' do
      pp = <<-EOS
        package { 'cron':
          ensure => present,
        }
        class { 'corp104_backup':
          server        => '10.1.10.200',
          server_target => '/backup',
          local_target  => '/backup',
        } 
        corp104_backup::cifs { 'default':
          backup_list => [ '/tmp', '/var/tmp' ],
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end

require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'modprobe class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'modprobe': }

      modprobe::install { 'cramfs':
        filename => 'CIS',
      }
      modprobe::install { 'freevxfs':
        filename => 'CIS',
      }
      modprobe::install { 'jffs2':
        filename => 'CIS',
      }
      modprobe::install { 'hfs':
        filename => 'CIS',
      }
      modprobe::install { 'hfsplus':
        filename => 'CIS',
      }
      modprobe::install { 'squashfs':
        filename => 'CIS',
      }
      modprobe::install { 'udf':
        filename => 'CIS',
      }
      modprobe::install { 'vfat':
        filename => 'CIS',
      }
      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/etc/modprobe.d/CIS.conf") do
      it { should be_file }
      its(:content) { should match 'install cramfs /bin/true' }
      its(:content) { should match 'install freevxfs /bin/true' }
      its(:content) { should match 'install jffs2 /bin/true' }
      its(:content) { should match 'install hfs /bin/true' }
      its(:content) { should match 'install hfsplus /bin/true' }
      its(:content) { should match 'install squashfs /bin/true' }
      its(:content) { should match 'install udf /bin/true' }
      its(:content) { should match 'install vfat /bin/true' }
    end

  end
end

require 'spec_helper'

describe 'yum_conf' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "yum_conf class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to create_class('yum_conf') }

          it { is_expected.to contain_class('yum_conf::params') }

        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'yum_conf class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      context 'shows failure' do
        it { expect { is_expected.to create_class('yum_conf') }.to raise_error(Puppet::Error, /Solaris not supported/) }
      end
    end
  end
end

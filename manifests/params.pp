# == Class yum_conf::params
#
# This class is meant to be called from yum_conf.
# It sets variables according to platform.
#
class yum_conf::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      # Defaults
      $metadata_expire = '6h'
      $multilib_policy = 'best'

      # Configuration file
      $config_file   = '/etc/yum.conf'
      $config_owner  = 'root'
      $config_group  = 'root'
      $config_mode   = '0644'
      $template      = 'yum_conf/yum.conf.erb'

      if versioncmp($::operatingsystemrelease, '6.0') < 0 {
        $cachedir = '/var/cache/yum'
      } else {
        $cachedir = '/var/cache/yum/$basearch/$releasever'
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}.")
    }
  }

}

# yum_conf - Used for managing installation and configuration
# of yum_conf (http://yum_conf.org/)
#
# @example
#   include yum_conf
#
# @example
#   class { 'yum_conf':
#     manage_repo    => false,
#     package_name   => 'yum_conf-custombuild',
#   }
#
# @author Peter Souter
#
# @param manage_package [Boolean] Whether to manage the yum_conf package
#
# @param manage_repo [Boolean] Whether to manage the package repositroy
#
# @param package_name [String] Name of the yum_conf package
#
# @param package_version [String] Version of the yum_conf package to install
#
# @param service_ensure [String] What status the service should be enforced to
#
# @param service_name [String] Name of the yum_conf service to manage
#
class yum_conf (
  $metadata_expire = $::yum_conf::params::metadata_expire,
  $multilib_policy = $::yum_conf::params::multilib_policy,
  $config_file   = $::yum_conf::params::config_file,
  $config_owner  = $::yum_conf::params::config_owner,
  $config_group  = $::yum_conf::params::config_group,
  $config_mode   = $::yum_conf::params::config_mode,
  $template      = $::yum_conf::params::template,
  $cachedir = $::yum_conf::params::cachedir,
) inherits ::yum_conf::params {

  file { $yum_conf::config_file:
    ensure  => present,
    mode    => $yum_conf::config_mode,
    owner   => $yum_conf::config_owner,
    group   => $yum_conf::config_group,
    content => template($yum_conf::template),
  }

}

# == Class: modprobe
#
# === modprobe::install documentation
#
class modprobe::install inherits modprobe {

  if($modprobe::manage_package)
  {
    # package here, for example: 
    #package { $modprobe::params::package_name:
    #  ensure => $modprobe::package_ensure,
    #}
  }

}

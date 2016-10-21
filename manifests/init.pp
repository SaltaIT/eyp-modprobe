# == Class: modprobe
#
# === modprobe documentation
#
class modprobe(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits modprobe::params{

  class { '::modprobe::install': } ->
  class { '::modprobe::config': } ~>
  class { '::modprobe::service': } ->
  Class['::modprobe']

}

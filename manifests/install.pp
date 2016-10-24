define modprobe::install(
                          $modulename = $name,
                          $command = '/bin/false'
                        ) {

  file { "/etc/modprobe.d/${modulename}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "install ${modulename} ${command}\n",
    require => Package[$modprobe::params::package_name],
  }
}

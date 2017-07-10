define modprobe::option(
                          $option,
                          $option_value = undef,
                          $ensure       = 'present',
                          $filename     = $name,
                          $modulename   = $name,
                          $order        = '00',
                        ) {
  if(! defined(Concat["/etc/modprobe.d/${filename}.conf"]))
  {
    concat { "/etc/modprobe.d/${filename}.conf":
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package[$modprobe::params::package_name],
    }
  }

  if($ensure == 'present')
  {
    concat::fragment{ "/etc/modprobe.d/${filename}.conf option ${modulename}":
      target  => "/etc/modprobe.d/${filename}.conf",
      order   => $order,
      content => template("${module_name}/options.erb"),
    }
  }
}

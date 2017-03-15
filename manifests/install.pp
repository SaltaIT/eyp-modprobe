define modprobe::install(
                          $filename   = $name,
                          $modulename = $name,
                          $command    = '/bin/true',
                          $order      = '00',
                        ) {

  if(! defined(Concat["/etc/modprobe.d/${filename}.conf"]))
  {
    concat { "/etc/modprobe.d/${filename}.conf":
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package[$modprobe::params::package_name],
    }
  }

  concat::fragment{ "/etc/modprobe.d/${filename}.conf ${modulename}":
    target  => "/etc/modprobe.d/${filename}.conf",
    order   => $order,
    content => "install ${modulename} ${command}\n",
  }



}

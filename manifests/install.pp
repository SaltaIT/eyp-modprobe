# puppet2sitepp @modprobeinstall
define modprobe::install(
                          $ensure     = 'present',
                          $filename   = $name,
                          $modulename = $name,
                          $command    = '/bin/true',
                          $order      = '00',
                        ) {
  include ::modprobe

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
    concat::fragment{ "/etc/modprobe.d/${filename}.conf install ${modulename}":
      target  => "/etc/modprobe.d/${filename}.conf",
      order   => $order,
      content => "install ${modulename} ${command}\n",
    }
  }
}

class modprobe::service inherits modprobe {

  #
  validate_bool($modprobe::manage_docker_service)
  validate_bool($modprobe::manage_service)
  validate_bool($modprobe::service_enable)

  validate_re($modprobe::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${modprobe::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $modprobe::manage_docker_service)
  {
    if($modprobe::manage_service)
    {
      #service or exec here
    }
  }
}

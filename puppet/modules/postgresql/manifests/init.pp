class postgresql($user,$password,$database) {

  $enhancers = ['postgresql', 'postgresql-contrib']
  package { $enhancers: ensure => 'installed' }

  $tmp_location = '/tmp'
  $postgres_user = 'postgres'
  $psql_command = "psql -U ${postgres_user}"
  $log_output = 'true'

  $user_file = 'create-user.sql'
  $user_file_path = "${tmp_location}/${user_file}"

  file { $user_file:
    path    => $user_file_path,
    ensure  => file,
    content => template("postgresql/${user_file}.erb"),
  }

  exec { 'create-user':
    command     => "${psql_command} -a -f ${user_file_path}",
    logoutput   => $log_output,
    user        => $postgres_user,
    require     => Package[$enhancers],
    subscribe   => File[$user_file],
    refreshonly => true
  }

  $database_file = 'create-database.sql'
  $database_file_path = "${tmp_location}/${database_file}"

  file { $database_file:
    path    => $database_file_path,
    ensure  => file,
    content => template("postgresql/${database_file}.erb"),
  }

  exec { 'create-database':
    command     => "${psql_command} -a -f ${database_file_path}",
    logoutput   => $log_output,
    user        => $postgres_user,
    require     => Exec['create-user'],
    subscribe   => File[$database_file],
    refreshonly => true
  }

}

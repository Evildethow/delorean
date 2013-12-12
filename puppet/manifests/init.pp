$webapp_home = "/webapps/delorean"
$virtualenv_name = 'env'
$virtualenv_home = "${webapp_home}/env"

Exec { path => [ '/bin', '/usr/bin', '/usr/local/bin' ] }

exec { "apt-update":
    command => "apt-get update"
}

Exec["apt-update"] -> Package <| |>

class { 'postgresql':
  user => 'vagrant',
  password => 'vagrant',
  database => 'vagrant',
}

class { 'virtualenv':
  home => '/webapps/delorean',
  name => 'env',
}

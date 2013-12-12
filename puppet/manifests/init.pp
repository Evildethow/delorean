$webapp_home = "/webapps/delorean"
$virtualenv_name = 'env'
$virtualenv_home = "${webapp_home}/env"

exec { "apt-update":
    command => "/usr/bin/apt-get update"
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

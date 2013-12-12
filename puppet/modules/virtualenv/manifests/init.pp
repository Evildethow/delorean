class virtualenv($home, $name) {

  package { 'python-virtualenv':
    ensure => 'installed'
  }

  exec { 'init-virtualenv':
    cwd => "${home}",
    command => "virtualenv ${name}",
    creates => "${home}/${name}",
    require => Package['python-virtualenv'],
  }
}
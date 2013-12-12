class virtualenv($home, $name) {

  package { 'python-virtualenv':
    ensure => 'installed'
  }

  exec { 'init-virtualenv':
    cwd => "${home}",
    path => '/usr/bin',
    command => "virtualenv ${name}",
    creates => "${home}/${name}",
    require => Package['python-virtualenv'],
  }
}
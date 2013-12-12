class django-postgresql($virtualenv_home) {

  $enchancers = [ "libpq-dev", "python-dev" ]
  package { $enhancers: ensure => "installed" }

  exec { 'psycopg2-install':
    cwd => $virtualenv_home,
    command => 'pip install psycopg2',
  }

}
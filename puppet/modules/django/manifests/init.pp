class django($virtualenv_home) {

  exec {'install-django':
    cwd => $virtualenv_home,
    command => 'pip install django',
    creates => "${$virtualenv_home}/django-admin.py"
  }

}
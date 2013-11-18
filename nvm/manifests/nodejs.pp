class nodejs {
  Exec {
    path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin'],
  }
  
  exec { "update-apt":
    command => "apt-get -y update && apt-get -y install python-software-properties && add-apt-repository ppa:chris-lea/node.js && apt-get update",
  }
  
  exec { "Install Heroku toolbelt"
    command => "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
  }

  package {
    "nodejs":
      ensure => installed,
      require => Exec["update-apt"];
    "nodejs-dev":
      ensure => installed,
      require => Exec["update-apt"];
    "npm":
      ensure => installed,
      require => Exec["update-apt"];
  }
}

Exec {
  path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin']
}

exec { "update-node":
  command => "apt-get -y update && apt-get -y install python-software-properties && add-apt-repository ppa:chris-lea/node.js && apt-get update"
}

exec { "update-emacs":
  command => "apt-get -y update && apt-add-repository ppa:cassou/emacs && apt-get update && apt-get install -y emacs24-nox"
}

exec { "Install Heroku toolbelt":
  command => "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
}

exec {"Install required npm packages":
  command => "sudo npm install -g express",
  require => Package['nodejs'];
}

package {
  "nodejs":
    ensure => latest,
    require => Exec["update-node"];
  "curl":
    ensure => installed;
  "git":
    ensure => latest;
  "emacs24-nox":
    ensure => installed,
    require => Exec["update-emacs"];
  "rlwrap":
    ensure => installed;
  "screen":
    ensure => installed;
}
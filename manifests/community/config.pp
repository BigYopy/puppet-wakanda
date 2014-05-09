class wakanda::community::config {
  require wakanda::community::install
  
  #wakanda default file
  file { "/etc/default/wakanda":
    ensure => present,
    content => template("wakanda/wakanda_default.erb"),
  }
  
  # create a link to wakanda bin
  file {"/usr/local/bin/wakanda":
    ensure => link,
    target => "/opt/wakanda/bin/wakanda",
  }
  
  # wakanda upstart job
  file { "/etc/init/wakanda.conf":
    ensure => present,
    source => "puppet:///modules/wakanda/wakanda.conf",
  }
  
}
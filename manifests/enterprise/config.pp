class wakanda::enterprise::config {
  require wakanda::enterprise::install
  
  file { "/etc/default/wakanda":
    ensure => present,
    content => template("wakanda/wakanda_default.erb"),
  }
  
  file {"/usr/local/bin/wakanda":
    ensure => link,
    target => "/opt/wakanda-enterprise/bin/wakanda",
  }
  
  file { "/etc/init/wakanda.conf":
    ensure => present,
    source => "puppet:///modules/wakanda/wakanda.conf",
  }
  
}
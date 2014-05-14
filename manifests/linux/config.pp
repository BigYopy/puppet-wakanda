class wakanda::linux::config {
  require wakanda::linux::install
  
  #wakanda default file
  file { "/etc/default/wakanda":
    ensure => present,
    content => template("wakanda/wakanda_default.erb"),
  }
  
  # create a link to wakanda bin
  file {"/usr/local/bin/wakanda":
    ensure => link,
    target => "${wakanda::wakanda_dir}/bin/wakanda",
  }
  
  # wakanda upstart job
  file { "/etc/init/wakanda.conf":
    ensure => present,
    source => "puppet:///modules/wakanda/wakanda.conf",
  }
  
}
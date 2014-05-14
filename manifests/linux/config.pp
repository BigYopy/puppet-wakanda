class wakanda::linux::config {
  require wakanda::linux::install
  
  ################################################################
  #wakanda community's bin name is different than enterprise's one
  #it may be better if they have the same name
  
  $wakanda_bin = $wakanda::enterprise ? {
    true => 'wakandaenterprise',
    default => wakanda,
  }
  ###############################################################
  
  #wakanda default file
  file { "/etc/default/wakanda":
    ensure => present,
    content => template("wakanda/wakanda_default.erb"),
  }
  
  # create a link to wakanda bin
  file {"/usr/local/bin/wakanda":
    ensure => link,
    target => "${wakanda::wakanda_dir}/bin/${$wakanda_bin}",
  }
  
  # wakanda upstart job
  file { "/etc/init/wakanda.conf":
    ensure => present,
    source => "puppet:///modules/wakanda/wakanda.conf",
  }
  
}
class wakanda::enterprise::service {
  
  service { "wakanda":
    ensure => running,
    provider => 'upstart',
    subscribe => Class["wakanda::enterprise::config"],
  }
  
}
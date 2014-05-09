class wakanda::community::service {
  
  service { "wakanda":
    ensure => running,
    provider => 'upstart',
    subscribe => Class["wakanda::community::config"],
  }
  
}
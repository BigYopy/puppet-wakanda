class wakanda::community::service {
  
  service { "wakanda":
    ensure => running,
    subscribe => Class["wakanda::community::config"],
  }
  
}
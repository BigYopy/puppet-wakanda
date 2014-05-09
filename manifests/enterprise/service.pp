class wakanda::enterprise::service {
  
  service { "wakanda":
    ensure => running,
    subscribe => Class["wakanda::enterprise::config"],
  }
  
}
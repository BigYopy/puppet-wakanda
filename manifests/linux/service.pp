class wakanda::linux::service {
  service { "wakanda":
    ensure => running,
    provider => 'upstart',
    subscribe => Class["wakanda::linux::config"],
  }
}
class wakanda::linux::install{
  Exec {
    path => "/usr/bin:/bin:/usr/sbin:/sbin",
    cwd => "/opt",
 }
  
  #Install wget to download wakanda package    
  package {'wget':
    ensure => present,
  }
  
  #download wakanda   
  exec { "get_wakanda":
    command => "wget ${wakanda::linux::url}",
    creates => "${wakanda::linux::wakanda_home}_${wakanda::wakanda_version}.0-${wakanda::wakanda_build}_${wakanda::arch}.tgz",
    }
   
  #Extract wakanda tgz
  exec {"install_wakanda":
    command => "tar xvzf ${wakanda::linux::wakanda_home}_${wakanda::wakanda_version}.0-${wakanda::wakanda_build}_${wakanda::arch}.tgz",
    creates => $wakanda::linux::wakanda_home,
  }
  
}
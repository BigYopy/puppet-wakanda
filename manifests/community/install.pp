class wakanda::community::install {
 
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
    command => "wget ${wakanda::download_url}",
    creates => "wakanda_${wakanda::wakanda_version}.0-${wakanda::wakanda_build}_${wakanda::arch}.tgz",
    }
   
  #Extract wakanda tgz
  exec {"install_wakanda":
    command => "tar xvzf wakanda_${wakanda::wakanda_version}.0-${wakanda::wakanda_build}_${wakanda::arch}.tgz -C /opt",
    creates => $wakanda::wakanda_dir,
  }
  
}
# Class: wakanda
#
# This module manages wakanda
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#


class wakanda (
 $enterprise=false,
 $build_number="8.160602",
 $admin_port=8080,
 $admin_ssl_port=4443,
 $solution_path="",
 $admin_password=undef,
 $debugger='none'
) {
 
$wakanda_version = regsubst($build_number,'^(\d+)\.(\d+)$','\1')
$wakanda_build = regsubst($build_number,'^(\d+)\.(\d+)$','\2')

$arch=$::architecture ? {
  'amd64'=>'amd64',
  default => 'i386',
}

      
  case $::kernel {
    
    'Linux':{ 
     if $enterprise {
       
       $wakanda_dir="/opt/wakanda-enterprise"
       $download_url="http://download.wakanda.org/ProductionChannel/v${wakanda_version}/Wakanda-Enterprise/Linux/${wakanda_build}/wakanda-enterprise_${wakanda_version}.0-${wakanda_build}_${arch}.tgz"
 
     }else {
       
       $wakanda_dir="/opt/wakanda"
       $download_url="http://download.wakanda.org/ProductionChannel/v${wakanda_version}/Wakanda/Linux/${wakanda_build}/wakanda_${wakanda_version}.0-${wakanda_build}_${arch}.tgz"
       
     }
    }
     default: {
      fail("\"${module_name}\" provides no config 
           for \"${::kernel}\"")
    }
   }
 class { 'wakanda::linux':
    url => $download_url,
    wakanda_home => $wakanda_dir,
  }  

}

class wakanda::linux (
  $url,
  $wakanda_home="/opt/wakanda"
){
  include wakanda::linux::install
  include wakanda::linux::config
  include wakanda::linux::service
}
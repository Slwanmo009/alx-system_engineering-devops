# This Puppet manifest kills a process named 'killmenow' using pkill
exec { 'kill_killmenow':
  command     => '/usr/bin/pkill killmenow',
  path        => '/usr/bin:/bin:/usr/sbin:/sbin',
  onlyif      => '/usr/bin/pgrep killmenow',
}

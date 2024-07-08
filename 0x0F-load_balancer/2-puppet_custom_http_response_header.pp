# This Puppet manifest installs Nginx and configures it to include a custom HTTP response header

# Ensure the package list is up-to-date
exec { 'apt_update':
  command => '/usr/bin/apt-get update',
  path    => '/usr/bin/',
}

# Install Nginx
package { 'nginx':
  ensure  => installed,
  require => Exec['apt_update'],
}

# Get the hostname
$hostname = $facts['networking']['hostname']

# Configure Nginx with the custom HTTP header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure the Nginx service is running
service { 'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}

# Template file for Nginx configuration
file { '/etc/puppetlabs/code/environments/production/modules/nginx/templates/default.erb':
  ensure  => file,
  content => @("EOF"/L),
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
    
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
    
        server_name _;
    
        location / {
            try_files \$uri \$uri/ =404;
        }
    
        add_header X-Served-By <%= @hostname %>;
    }
    | EOF
}

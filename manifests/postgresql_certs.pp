class dist_certs::postgresql_certs {

  File {
    owner  => 'pe-postgres',
    group  => 'pe-postgres',
    mode   => '0600',
  }

  file { 'postgres_private_key':
    ensure => file,
    path   => "/opt/puppet/var/lib/pgsql/9.2/data/certs/${::clientcert}.private_key.pem",
    source => "/etc/puppetlabs/puppet/ssl/private_keys/${::clientcert}.pem",
  }

  file { 'postgres_public_key':
    ensure => file,
    path   => "/opt/puppet/var/lib/pgsql/9.2/data/certs/${::clientcert}.public_key.pem",
    source => "/etc/puppetlabs/puppet/ssl/public_keys/${::clientcert}.pem",
  }

  file { 'postgres_cert':
    ensure => file,
    path   => "/opt/puppet/var/lib/pgsql/9.2/data/certs/${::clientcert}.cert.pem",
    source => "/etc/puppetlabs/puppet/ssl/certs/${::clientcert}.pem",
  }

}

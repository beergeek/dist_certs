class dist_certs::puppetdb_certs {

  $cert_path = '/etc/puppetlabs/puppetdb/ssl/'
  $ssldir = '/etc/puppetlabs/puppet/ssl'

  File {
    owner  => 'pe-puppetdb',
    group  => 'pe-puppetdb',
    mode   => '0600',
    notify => Service['pe-puppetdb'],
  }

  file { "${cert_path}/m0.puppetlabs.vm.cert.pem":
    ensure  => file,
    content => file("${ssldir}/certs/m0.puppetlabs.vm.pem"),
  }

  file { "${cert_path}/m0.puppetlabs.vm.pem":
    ensure  => file,
    content => file("${ssldir}/public_keys/m0.puppetlabs.vm.cert.pem"),
  }

  file { "${cert_path}/m0.puppetlabs.vm.private_key.pem":
    ensure  => file,
    content => file("${ssldir}/private_keys/m0.puppetlabs.vm.pem"),
  }

  service { 'pe-puppetdb':
    ensure => running,
    enable => true,
  }

}

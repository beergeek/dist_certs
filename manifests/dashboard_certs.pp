class dist_certs::dashboard_certs {

  $cert_path = '/opt/puppet/share/puppet-dashboard/certs'
  $ssldir = '/etc/puppetlabs/puppet/ssl'

  File {
    owner  => 'puppet-dashboard',
    group  => 'puppet-dashboard',
    mode   => '0600',
    notify => Service['pe-httpd'],
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

  file { "${cert_path}/pe-internal-dashboard.cert.pem":
    ensure  => file,
    content => file("${ssldir}/certs/pe-internal-dashboard.pem"),
  }

  file { "${cert_path}/pe-internal-dashboard.public_key.pem":
    ensure  => file,
    content => file("${ssldir}/public_keys/pe-internal-dashboard.pem"),
  }

  file { "${cert_path}/pe-internal-dashboard.private_key.pem":
    ensure  => file,
    content => file("${ssldir}/private_keys/pe-internal-dashboard.pem"),
  }

  file { "${cert_path}/ca_cert.pem":
    ensure  => link,
    target => "${ssldir}/certs/ca.pem",
  }

  file { "${cert_path}/crl.pem":
    ensure  => link,
    target => "${ssldir}/crl.pem",
  }

  service { 'pe-httpd':
    ensure => running,
    enable => true,
  }

}

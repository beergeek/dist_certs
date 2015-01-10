class dist_certs::console_services_certs {

  $cert_path = '/opt/puppet/share/console-services/certs'
  $ssldir = '/etc/puppetlabs/puppet/ssl'

  File {
    owner  => 'pe-console-services',
    group  => 'pe-console-services',
    mode   => '0600',
    notify => Service['pe-console-services'],
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

  file { "${cert_path}/pe-internal-classifier.cert.pem":
    ensure  => file,
    content => file("${ssldir}/certs/pe-internal-classifier.pem"),
  }

  file { "${cert_path}/pe-internal-classifier.public_key.pem":
    ensure  => file,
    content => file("${ssldir}/public_keys/pe-internal-classifier.pem"),
  }

  file { "${cert_path}/pe-internal-classifier.private_key.pem":
    ensure  => file,
    content => file("${ssldir}/private_keys/pe-internal-classifier.pem"),
  }

  service { 'pe-console-services':
    ensure => running,
    enable => true,
  }

}

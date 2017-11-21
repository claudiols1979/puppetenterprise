class ntp::params {
	case $::operatingsystem {
                'centos': { 
			$template = 'ntp.conf.erb' 
			$service_name = 'ntpd'
			$default_servers = [ "0.centos.pool.ntp.org iburst",
						"1.centos.pool.ntp.org iburst",
						"2.centos.pool.ntp.org iburst",
						"3.centos.pool.ntp.org iburst", ]
		}

                'ubuntu': { 
			$template = 'ntp.ubuntu.erb' 
			$service_name = 'ntp'
			$default_servers = [ "0.ubuntu.pool.ntp.org",
						"1.ubuntu.pool.ntp.org",
						"2.ubuntu.pool.ntp.org",
						"3.ubuntu.pool.ntp.org", ]  

		}

                default: { fail('OS $::operatingsystem is not currently supported') }
        }
}

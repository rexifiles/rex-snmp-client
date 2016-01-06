package Rex::Snmp::Client; 
use Rex -base;
use Rex::Ext::ParamLookup;

# Usage: rex setup --monitor=192.168.0.0 [ --community=public ]
# Usage: rex remove

desc 'Set up snmpd';
task 'setup', sub { 

	unless ( is_installed("snmpd") ) {
	pkg "snmpd",
		ensure => "installed",
		on_change => sub {
			say "snmpd package installed";
		};
   	}

	my $monitor   = param_lookup "monitor";
	my $community = param_lookup "community", "public";

	file "/etc/snmp/snmpd.conf",
		content => template("files/etc/snmp/snmpd.tmpl", conf => { monitor_server => "$monitor", community_string => "$community" }),
		on_change => sub { 
			say "config updated. ";
			service snmpd => "restart";
			};

	service snmpd => ensure => "started";
};

desc 'Remove plugin';
task 'remove', sub {

	Rex::Logger::info "Coming soon. ",'error';
}

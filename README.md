# rex-snmp-client

<h3>setup()</h3>
Will add the snmpd package and configure to the monitoring server of your chosing


```
task "setup", make {

  Rex::Collectd::Base::setup(monitoring=>"192.168.1.100",community=>"public");
  # Rex::Collectd::Base::remove;

};
```

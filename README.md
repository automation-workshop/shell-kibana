# shell-kibana

Vagrant setup for a Kibana 4 and Elasticsearch VM combo with shell-script provisioning.

Spin-up
-------

~~~
$ vagrant up
~~~

This will download and bootstrap two Ubuntu 14.04 VMs and install the necessary software packages on the individual VMs.

Exposed ports
-------------

This setup currently exposes `:9200` and `:9300` for Elasticsearch data
ingestion on `192.168.50.7` and `:5601` for the Kibana dashboard on `192.168.50.6`.

Shared folders
--------------

Elasticsearch data is stored outside of the Elasticsearch VM in `esdata/`.

# Websphere-MQ-Template-for-Zabbix
Websphere MQ Template for Zabbix monitor, automatically discovering MQM and local Queue, checking MQM's status and Queue's Depth.

## Install
On Zabbix's agent

1. Add zabbix user to mqm's group,ensuring zabbix can run mq's command (e.g.dspmq);
2. Copy the "bin" scripts folder to /etc/zabbix/;
3. Copy mq.conf to /etc/zabbix/zabbix_agentd.d/;
4. Restare zabbix-agent.

On Zabbix's sever

1. Import zbx_ibm_websphere_mqm_templates.xml; 
2. Apply the template to the host running MQ;
3. Wait for discovery of MQM and Queue, and then enjoy !

##Note
1. The script will automatically discover all Local Queues except SYSTEM queues.
2. The default triggers of queue depth is 500/1w/10w.
3. Tested on Linux and AIX.

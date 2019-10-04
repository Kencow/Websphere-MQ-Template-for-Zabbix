# Websphere MQ Template for Zabbix-3.4
Websphere MQ Template for Zabbix monitor, autodiscover MQM, local Queue, local Channel, checking MQM's status, Queue's Depth, and Channel's Status.

## Installation
* On Zabbix's agent

  1. Add zabbix user to mqm's group,ensuring zabbix can run mq's command (e.g. dspmq);
  2. Copy the "bin" scripts folder to /etc/zabbix/;
  3. Add permission on execute on /etc/zabbix/bin/.sh shell scripts to zabbix user
     chmod uog+x /etc/zabbix/bin/*
     or
     chown -R zabbix:zabbix /etc/zabbix/bin/*
  4. Copy mq.conf to /etc/zabbix/zabbix_agentd.d/;
  5. Restart zabbix-agent.

* On Zabbix's sever
  1. Import zbx_ibm_websphere_mqm_templates.xml; 
  2. Apply the template to the host running MQ;
  3. Wait for discovery of MQM, Queue and Channel, and then enjoy !

## Notes
1. The script will autodiscover all Local Queues except "SYSTEM*" queues, and all Local channels except "SYSTEM*"
2. The default triggers of queue depth is 500/1w/10w.
   The default triggers of status of channel is activate on NOT RUNNING STATE
   mq_status shell script return next values depend on state:
   - RUNNING-1
   - RETRYING-2
   - 'PAUSED STATE'-3
   - STOPPED-4
   - INACTIVE-0
3. Tested mqm running on Linux Ubuntu 16.04, zabbix server 3.4, zabbix-agent 3.4.9, websphere mq on docker(9 version)

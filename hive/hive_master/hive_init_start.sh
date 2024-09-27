#/bin/bash
# mysql -h 172.18.0.4 -u'root' -p'1111' -e "CREATE DATABASE hive CHARSET UTF8"
/opt/hive/bin/schematool -initSchema -dbType mysql -verbos
/opt/hive/bin/hive --service metastore >> /opt/hive/logs/metastore.log 2>&1 &
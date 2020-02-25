#!/bin/bash
# Inspired from https://github.com/hhcordero/docker-jmeter-client
# Basically runs jmeter, assuming the PATH is set to point to JMeter bin-dir (see Dockerfile)
#
# This script expects the standdard JMeter command parameters.
#
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "START Running Jmeter on `date`"
echo "JVM_ARGS=${JVM_ARGS}"
echo "jmeter args=$@"

# Keep entrypoint simple: we must pass the standard JMeter arguments
echo $@
#jmeter $@

echo "GIT_URL=${GIT_URL}"
echo "GIT_PROJECT=${GIT_PROJECT}"
echo "JMETER_LIB_EXT=${JMETER_LIB_EXT}"
echo "JMETER_SCRIPT_HOME=${JMETER_SCRIPT_HOME}"
echo "JMX_FILE_NAME=${JMX_FILE_NAME}"

cd /home/jmeterscript
git clone ${GIT_URL} 
ls /home/jmeterscript/
ls /home/jmeterscript/${GIT_PROJECT}/jmeterinfo

echo "Before Java code run"
java -classpath /home/jmeterscript/${GIT_PROJECT}/jmeterinfo/*:${JMETER_LIB_EXT}/*:${JMETER_LIB}/* zerotest.JmeterUtil "${JMETER_HOME}" "/home/jmeterscript/${GIT_PROJECT}/jmeterinfo" "${JMX_FILE_NAME}" "${OUTPUT_TYPE}"
echo "After Java code run"

echo "END Running Jmeter on `date`"

#     -n \
#    -t "/tests/${TEST_DIR}/${TEST_PLAN}.jmx" \
#    -l "/tests/${TEST_DIR}/${TEST_PLAN}.jtl"
# exec tail -f jmeter.log
#    -D "java.rmi.server.hostname=${IP}" \
#    -D "client.rmi.localport=${RMI_PORT}" \
#  -R $REMOTE_HOSTS

#cputest.jmx
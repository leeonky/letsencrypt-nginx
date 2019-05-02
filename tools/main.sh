set -x
PRJ_PATH=$(dirname "$0")/../

. ${PRJ_PATH}/tools/lets.sh

remove_domains &&\
config_domains &&\
reset_nginx &&\
remove_certs &&\
obtain_certs &&\
reset_nginx

while true
do
	certbot renew
	sleep 3600
done

git pull

if [ -z "$1" -o -z "$2" -o -z "$3" -o -z "$4"]; then
    echo -e "\e[31m Input is missing\e[0m]"
    echo "Expected Usage: \n\t\t bash init.sh frontend dev PWD VaultToken"
    exit 89
fi


COMPONENT=$1
ENV=$2
SSH_PASSWORD=$3
vault_token=$4

#ansible-playbook -i ${COMPONENT}-${ENV} -e ansible_user=ec2-user -e ansible_password=DevOps321 -e COMPONENT=${COMPONENT} -e ENV=${ENV} main.yml

ansible-playbook -i ${COMPONENT}-${ENV}.devsecopswithshri.site, -e ansible_user=ec2-user -e ansible_password=${SSH_PASSWORD} -e COMPONENT=${COMPONENT} -e ENV=${ENV} -e vault_token=${vault_token} main.yml


echo "Printing environment variables To detect any secrets leakage"
env
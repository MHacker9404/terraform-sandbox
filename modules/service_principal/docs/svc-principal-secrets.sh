subscriptionId=$1
subscriptionName=$2
resource_group=$3
checkIntoKeyvault=$4
keyvaultname=$5
keyvaultsubscription=$6

az account set -s $subscriptionId
cred=$(az ad sp create-for-rbac --name $subscriptionName-Automate --role Contributor --scopes /subscriptions/$subscriptionId)

echo "Creds:"
echo $cred

# parse json and store in keyvault
client_id=$(echo "$cred" | jq -r '.appId')
displayName=$(echo "$cred" | jq -r '.displayName')
pwd=$(echo "$cred" | jq -r '.password')
tenant=$(echo "$cred" | jq -r '.tenant')

if [[ $checkIntoKeyvault == "true" ]]; then
    client_id_name="$subscriptionName-automate-clientid"
    client_secret_name="$subscriptionName-automate-clientsecret"
    az keyvault secret set --name "$client_id_name" --value "$client_id" --vault-name $keyvaultname --subscription $keyvaultsubscription
    az keyvault secret set --name "$client_secret_name" --value "$pwd" --vault-name $keyvaultname --subscription $keyvaultsubscription
fi
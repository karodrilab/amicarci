# Get the private key from the environment variable
echo "Setting up DevHub Connection..."
mkdir JWT
echo $SFDC_SERVER_KEY | base64 -d > JWT/server.key

# Authenticate to salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant --clientid $SFDX_CONSUMER_KEY	 --jwtkeyfile JWT/server.key --username $SFDC_PROD_USER --setdefaultdevhubusername -a karodrilab

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s
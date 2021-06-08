#Convert to MDAPI format for deployment to prod
echo "Converting to MDAPI format..."
sfdx force: mdapi:convert -d deploy_prod -r mdapipackage /
#sfdx force:source:convert -d deploy_prod -r src
#Deploy to prod & run all tests
echo "Deploying to Desa & running all tests..."
sfdx force:mdapi:deploy -u karodrilab -d deploy_prod/ -w -1 -l RunAllTestsInOrg
#sfdx force:source:deploy -x C:/Users/karen/Documents/GitHub/amicarci/src/main/default/package.xml -g
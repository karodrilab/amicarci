#Convert to MDAPI format for deployment to prod
echo "Converting to MDAPI format..."
sfdx force:source:convert -r ./src/ -d deploy_prod
#Deploy to prod & run all tests
echo "Deploying to production & running all tests..."
sfdx force:mdapi:deploy -u DevHub -d deploy_prod/ -w -1 -l RunAllTestsInOrg

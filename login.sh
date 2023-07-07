# chmod 755 ./login.sh
# ./login.sh

## jq is a lightweight and flexible command-line JSON processor.
# brew install jq

# curl -d "name=name&password=password" localhost:3000/auth/login/

TOKEN=$(curl -s -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --data '{"name":"name","password":"password","rememberMe":false}' localhost:3000/auth/login/ > ./token.json)


sleep 1
echo 1 $TOKEN

wait 
sleep 1


ID=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjg4NzU4NDY4fQ.RfR8ptfrPA_x7Yh7H5tB0oIOeWddJjg4EXnPTb5mS7Y

echo 99 $ID

curl -H 'Accept: application/json' -H "Authorization: Bearer ${ID}" localhost:3000/auth/secretDebug/


sleep 2

curl -H 'Accept: application/json' -H "Authorization: Bearer ${ID}" localhost:3000/auth/secret/

# chmod 755 ./login.sh
# ./login.sh

## jq is a lightweight and flexible command-line JSON processor.
# brew install jq

# curl -d "name=name&password=password" localhost:3000/auth/login/

TOKEN=$(curl -s -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --data '{"name":"name","password":"password","rememberMe":false}' localhost:3000/auth/login/ | jq -r '.token' )

wait 
echo 1 $TOKEN

#ID=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjg4NzU4NDY4fQ.RfR8ptfrPA_x7Yh7H5tB0oIOeWddJjg4EXnPTb5mS7Y
curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" localhost:3000/auth/secretDebug/
wait
curl -v -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" localhost:3000/auth/secret/

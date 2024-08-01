# Jira (jira.andronymous.ir)

this service is a dedicated and cracked Jira service hosted on jira.andronymous.ir using reverse proxy.


## 1. Database:
First create a database container supported with jira (like mysql or postgresql) 


## 2. Customized Dockerfile
Create a Dockerfile to add the agent package inside the container 

## 3. Build the Image
```shell
docker build -t wangzan18/jira:latest .
```

## 4. Config files
Run the image using docker-compose file

## 5. check the service using ip and port
use the server ip:port to connect to service 

## 6. Connect to DB
After runing the service is setup chose `i'll set it up myself` and connect to database service 


Use `server ID` to run the agent
```shell
docker exec jira java -jar /opt/atlassian/jira/atlassian-agent.jar -d -m dev@andronymous.ir -n BAT -p jira -o http://188.121.99.16 -s B6CH-GYAA-07JL-X8L9
#
```

## 5. Config files are in
```
/data/jira/conf
```

## See
`https://virgool.io/@vaysi/%D8%B1%D8%A7%D9%87-%D8%A7%D9%86%D8%AF%D8%A7%D8%B2%DB%8C-jira-%D9%88-confluence-%D8%A8%D8%B1-%D8%B1%D9%88%DB%8C-%D8%AF%D8%A7%DA%A9%D8%B1-%D9%82%D8%B3%D9%85%D8%AA-%D8%A7%D9%88%D9%84-r2qwu9rgxkrb`
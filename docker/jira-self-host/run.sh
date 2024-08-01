docker run -d --name jira \
  --restart always \
  -p 18009:8080 \
  -e TZ="Asia/Tehran" \
  -m 4098M \
  -v /data/jira/data:/var/atlassian/jira \
  wangzan18/jira:latest
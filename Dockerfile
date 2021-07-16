FROM sconecuratedimages/public-apps:node-10-alpine-scone3.0.0-v1
ENV SCONE_HEAP=1G
EXPOSE 3000
RUN apk add --no-cache nodejs-npm \
  && mkdir myapp \
  && cd myapp \
  && echo "{" > package.json \
  && echo '"name": "myapp",' >> package.json \
  && echo '"version": "1.0.0",' >> package.json \
  && echo '"description": "",' >> package.json \
  && echo '"main": "app.js",' >> package.json \
  && echo '"scripts":' >> package.json { \
  && echo '  "test": "echo \"Error: no test specified\" && exit 1"' >> package.json \
  && echo '},' >> package.json \
  && echo '"author": "",' >> package.json \
  && echo '"license": "ISC"' >> package.json \
  && echo '}' >> package.json \
  && npm install express --save \
  && echo "var express = require('express');" > app.js \
  && echo "var app = express();" >> app.js \
  && echo "app.get('/', function (req, res) {" >> app.js \
  && echo "  res.send('Hello World!');" >> app.js \
  && echo "});" >> app.js \
  && echo "app.listen(3000, function () {" >> app.js \
  && echo "  console.log('Example app listening on port 3000!');" >> app.js \
  && echo "});" >> app.js 

CMD SCONE_VERSION=1 node /myapp/app.js
# Common build stage
FROM node:16-alpine3.14 as common-build-stage

USER 1000

COPY . ./app

WORKDIR /app

RUN npm install

RUN npm run build

EXPOSE 3000

FROM common-build-stage as production-build-stage

ENV NODE_ENV production
ENV PORT 3000

CMD node dist/server.js

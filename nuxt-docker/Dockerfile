FROM node:16-alpine as builder

ENV DOCKER_BUILDKIT=1

WORKDIR /app

COPY . .

RUN npm ci && \
npx nuxt build

RUN rm -rf node_modules && \
npm i --ignore-scripts --omit=dev

RUN find libs -mindepth 2 -maxdepth 2 -name dist -o -name package.json -prune -o -exec rm -rf {} +


FROM node:16-alpine as runner

ENV NODE_ENV=PRODUCTION

WORKDIR /app

COPY --from=builder /app/libs ./libs

COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app/modules ./modules
COPY --from=builder /app/middleware ./middleware

COPY --from=builder /app/nuxt.config.js ./nuxt.config.js

COPY --from=builder /app/.nuxt ./.nuxt
COPY --from=builder /app/static ./static

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npx", "nuxt-start" ]
# STAGE 0
FROM node:17

WORKDIR /build

COPY package.json package-lock.json ./
RUN ["npm", "install"]

COPY . .
RUN ["npx", "webpack"]

# STAGE 1
FROM node:17

WORKDIR /app

COPY package.json package-lock.json ./
RUN ["npm", "install", "--production"]

COPY --from=0 /build/out/bundle.cjs ./
ENTRYPOINT ["node", "bundle.cjs"]

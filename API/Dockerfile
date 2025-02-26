FROM oven/bun:latest
COPY package.json .
RUN bun install
COPY ./index.ts .
EXPOSE 3000
ENTRYPOINT bun run index.ts
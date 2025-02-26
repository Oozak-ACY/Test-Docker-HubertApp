FROM oven/bun:latest
COPY ./API/package.json .
RUN bun install
COPY ./API/index.ts .
EXPOSE 3000
ENTRYPOINT bun run index.ts
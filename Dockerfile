FROM node:16-alpine as builder
WORKDIR '/app'
COPY  ./package.json .
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

FROM nginx:latest as runner
COPY --from=builder /app/build /usr/share/nginx/html

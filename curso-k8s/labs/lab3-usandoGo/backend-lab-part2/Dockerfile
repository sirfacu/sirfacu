FROM golang:1.13 as builder

WORKDIR /app
COPY ./src/main.go .
#la siguietne linea me compila y genera un binario llamado myApp
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://proxy.golang.org go build -o myApp ./main.go 

FROM alpine:latest
#RUN apk --no-cache add ca-certificates mailcap && addgroup -S app -G app
#USER app

WORKDIR /app
COPY --from=builder /app/myApp .
ENTRYPOINT [ "./myApp" ] 

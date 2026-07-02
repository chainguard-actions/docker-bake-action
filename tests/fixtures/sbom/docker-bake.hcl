target "sbomapp" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo hello"
  tags = ["sbomapp:test"]
}

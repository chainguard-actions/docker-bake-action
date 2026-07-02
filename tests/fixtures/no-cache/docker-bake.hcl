target "nocacheapp" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo no-cache-test"
  tags = ["nocacheapp:test"]
}

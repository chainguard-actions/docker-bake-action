target "netapp" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo hello"
  tags = ["netapp:test"]
}

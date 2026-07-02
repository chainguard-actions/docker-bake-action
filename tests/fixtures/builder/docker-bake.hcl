target "builderapp" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo hello"
  tags = ["builderapp:test"]
}

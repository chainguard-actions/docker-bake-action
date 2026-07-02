target "checkme" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo check-test"
  tags = ["checkme:latest"]
}

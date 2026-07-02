variable "TAG" {
  default = "original"
}

target "myimage" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo set-override-test"
  tags = ["myimage:${TAG}"]
}

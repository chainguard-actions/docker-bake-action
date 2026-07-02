variable "VERSION" {
  default = "latest"
}

variable "APP_NAME" {
  default = "myapp"
}

target "varsapp" {
  context = "."
  dockerfile-inline = "FROM alpine:3.19\nRUN echo vars-test"
  tags = ["${APP_NAME}:${VERSION}"]
}

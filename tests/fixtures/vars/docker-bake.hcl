variable "APP_VERSION" {
  default = "0.0.0"
}

group "default" {
  targets = ["varsapp"]
}

target "varsapp" {
  context    = "tests/fixtures/vars"
  dockerfile = "Dockerfile"
  tags       = ["varsapp:${APP_VERSION}"]
  output     = ["type=docker"]
  args = {
    APP_VERSION = APP_VERSION
  }
}

variable "APP_VERSION" {
  default = "dev"
}

group "default" {
  targets = ["varapp"]
}

target "varapp" {
  context    = "tests/fixtures/vars"
  dockerfile = "Dockerfile"
  tags       = ["varapp:test"]
  output     = ["type=docker"]
  args = {
    APP_VERSION = APP_VERSION
  }
}

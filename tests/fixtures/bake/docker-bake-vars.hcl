variable "APP_NAME" {
  default = "world"
}

group "default" {
  targets = ["app-vars"]
}

target "app-vars" {
  context    = "tests/fixtures/bake"
  dockerfile = "Dockerfile"
  tags       = ["myapp-vars:latest"]
  args = {
    name = APP_NAME
  }
}

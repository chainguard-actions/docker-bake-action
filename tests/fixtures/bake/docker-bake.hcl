group "default" {
  targets = ["app"]
}

target "app" {
  context    = "tests/fixtures/bake"
  dockerfile = "Dockerfile"
  tags       = ["myapp:latest"]
  args = {
    name = "world"
  }
}

target "app-custom" {
  context    = "tests/fixtures/bake"
  dockerfile = "Dockerfile"
  tags       = ["myapp:custom"]
  args = {
    name = "custom"
  }
}

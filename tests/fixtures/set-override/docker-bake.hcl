target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["bake-set-test:latest"]
  args = {
    BUILD_VERSION = "1.0.0"
  }
}

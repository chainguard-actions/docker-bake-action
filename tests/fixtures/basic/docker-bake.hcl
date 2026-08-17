target "app" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["bake-test-app:latest"]
  args = {
    name = "bake-test"
  }
}

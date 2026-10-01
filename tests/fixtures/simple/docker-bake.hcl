target "app" {
  context    = "./tests/fixtures/simple"
  dockerfile = "Dockerfile"
  tags       = ["test-bake-app:local"]
  args = {
    greeting = "world"
  }
}

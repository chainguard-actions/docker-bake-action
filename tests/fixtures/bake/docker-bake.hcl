target "app" {
  context    = "tests/fixtures/bake"
  dockerfile = "Dockerfile"
  tags       = ["bake-test-app:latest"]
  args = {
    greeting = "Hello"
  }
}

target "app-custom" {
  context    = "tests/fixtures/bake"
  dockerfile = "Dockerfile"
  tags       = ["bake-test-app-custom:latest"]
  args = {
    greeting = "Custom"
  }
}

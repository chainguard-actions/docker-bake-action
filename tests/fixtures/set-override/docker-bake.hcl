group "default" {
  targets = ["webapp"]
}

target "webapp" {
  context    = "tests/fixtures/set-override"
  dockerfile = "Dockerfile"
  tags       = ["webapp:original"]
  output     = ["type=docker"]
  args = {
    greeting = "hello"
  }
}

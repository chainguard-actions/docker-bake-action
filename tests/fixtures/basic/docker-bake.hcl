group "default" {
  targets = ["myapp"]
}

target "myapp" {
  context    = "tests/fixtures/basic"
  dockerfile = "Dockerfile"
  tags       = ["myapp:test"]
  output     = ["type=docker"]
}

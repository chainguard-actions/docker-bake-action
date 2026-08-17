group "default" {
  targets = ["allowapp"]
}

target "allowapp" {
  context    = "tests/fixtures/allow"
  dockerfile = "Dockerfile"
  tags       = ["allowapp:test"]
  output     = ["type=docker"]
}

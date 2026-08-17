group "default" {
  targets = ["provapp"]
}

target "provapp" {
  context    = "tests/fixtures/provenance"
  dockerfile = "Dockerfile"
  tags       = ["provapp:test"]
  output     = ["type=docker"]
}

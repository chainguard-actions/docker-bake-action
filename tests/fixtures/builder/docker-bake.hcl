group "default" {
  targets = ["builderapp"]
}

target "builderapp" {
  context    = "tests/fixtures/builder"
  dockerfile = "Dockerfile"
  tags       = ["builderapp:test"]
  output     = ["type=docker"]
}

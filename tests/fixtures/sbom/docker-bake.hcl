group "default" {
  targets = ["sbomapp"]
}

target "sbomapp" {
  context    = "tests/fixtures/sbom"
  dockerfile = "Dockerfile"
  tags       = ["sbomapp:test"]
  output     = ["type=docker"]
}

target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:sbom-test"]
  output     = ["type=cacheonly"]
}

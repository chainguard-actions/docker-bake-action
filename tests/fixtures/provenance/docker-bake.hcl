target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:provenance-test"]
  output     = ["type=cacheonly"]
}

target "metaapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["metaapp:test"]
  output     = ["type=cacheonly"]
}

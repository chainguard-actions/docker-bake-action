target "sbomapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["sbomapp:test"]
  output     = ["type=cacheonly"]
}

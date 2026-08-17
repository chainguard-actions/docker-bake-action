target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:test"]
  output     = ["type=cacheonly"]
}

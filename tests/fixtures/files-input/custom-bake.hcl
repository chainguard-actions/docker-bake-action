target "customapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["customapp:test"]
  output     = ["type=cacheonly"]
}

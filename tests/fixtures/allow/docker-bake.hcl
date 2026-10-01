target "allowapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["allowapp:test"]
  output     = ["type=cacheonly"]
}

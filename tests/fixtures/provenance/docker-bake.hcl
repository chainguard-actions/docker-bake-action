target "provapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["provapp:test"]
  output     = ["type=cacheonly"]
}

target "attestapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["attestapp:test"]
  output     = ["type=cacheonly"]
}

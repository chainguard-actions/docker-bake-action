target "checkapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["checkapp:test"]
  output     = ["type=cacheonly"]
}

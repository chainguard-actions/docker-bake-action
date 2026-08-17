target "nocacheapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["nocacheapp:test"]
  output     = ["type=cacheonly"]
}

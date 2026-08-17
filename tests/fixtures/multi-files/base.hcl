target "multiapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["multiapp:test"]
  output     = ["type=cacheonly"]
}

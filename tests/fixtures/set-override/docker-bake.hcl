target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:set-test"]
  output     = ["type=cacheonly"]
}

target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:builder-test"]
  output     = ["type=cacheonly"]
}

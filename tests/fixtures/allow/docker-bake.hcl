target "myapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["myapp:allow-test"]
  output     = ["type=cacheonly"]
}

target "builderapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["builderapp:test"]
  output     = ["type=cacheonly"]
}

target "setapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["setapp:test"]
  output     = ["type=cacheonly"]
  args = {
    VERSION = "original"
  }
}

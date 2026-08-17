target "builderapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["bake-builder-test:latest"]
  args = {
    name = "builder-test"
  }
}

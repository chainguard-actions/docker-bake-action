target "checkapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["bake-check-test:latest"]
}

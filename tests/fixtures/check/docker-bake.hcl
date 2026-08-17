target "checkapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["checkapp:test"]
}

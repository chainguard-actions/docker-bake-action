target "fileapp" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["bake-files-test:latest"]
  args = {
    name = "files-test"
  }
}

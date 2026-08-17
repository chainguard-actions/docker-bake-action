target "app1" {
  context    = "."
  dockerfile = "Dockerfile.app1"
  tags       = ["bake-multi-app1:latest"]
}

target "app2" {
  context    = "."
  dockerfile = "Dockerfile.app2"
  tags       = ["bake-multi-app2:latest"]
}

group "all" {
  targets = ["app1", "app2"]
}

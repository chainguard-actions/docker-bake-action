group "default" {
  targets = ["img1", "img2"]
}

target "img1" {
  context    = "./tests/fixtures/group"
  dockerfile = "Dockerfile"
  target     = "img1"
  tags       = ["test-bake-img1:local"]
}

target "img2" {
  context    = "./tests/fixtures/group"
  dockerfile = "Dockerfile"
  target     = "img2"
  tags       = ["test-bake-img2:local"]
}

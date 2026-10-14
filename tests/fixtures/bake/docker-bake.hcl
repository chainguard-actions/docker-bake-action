target "hello" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-hello:latest"]
  output = ["type=docker"]
}

target "hello-nocache" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-nocache:latest"]
  output = ["type=docker"]
}

variable "GREETING" {
  default = "world"
}

target "hello-vars" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-vars:latest"]
  args = {
    greeting = GREETING
  }
  output = ["type=docker"]
}

target "hello-provenance" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-provenance:latest"]
  output = ["type=docker"]
}

target "hello-sbom" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-sbom:latest"]
  output = ["type=docker"]
}

target "hello-allow" {
  dockerfile = "tests/fixtures/bake/Dockerfile"
  tags = ["bake-test-allow:latest"]
  output = ["type=docker"]
}

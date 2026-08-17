group "default" {
  targets = ["checker"]
}

target "checker" {
  context    = "tests/fixtures/call-check"
  dockerfile = "Dockerfile"
  tags       = ["checker:test"]
}

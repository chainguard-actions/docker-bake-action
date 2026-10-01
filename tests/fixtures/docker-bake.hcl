group "default" {
  targets = ["hello"]
}

target "hello" {
  dockerfile-inline = <<EOF
FROM alpine:3.19
RUN echo "Hello from bake!"
EOF
  tags = ["hello:test"]
  output = ["type=cacheonly"]
}

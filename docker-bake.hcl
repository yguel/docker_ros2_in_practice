# docker-bake.hcl

group "default" {
  targets = [
    "humble"
    ]
}

# Common variables
variable "REGISTRY_PREFIX" {
  default = "docker.io/yguel/ros2_in_practice"
}

# Common settings
target "common" {
  dockerfile = "Dockerfile"
}

target "humble" {
  inherits = ["common"]
  context = "humble"
  tags = [
    "${REGISTRY_PREFIX}:humble",
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

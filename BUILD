load("@rules_python//python:defs.bzl", "py_binary")
load("@my_deps//:requirements.bzl", "requirement")
load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")

py_binary(
    name = "app",
    srcs = ["app.py"],
    deps = [
        requirement("flask"),  # Use lowercase 'flask' to match package name
    ],
)

py3_image(
    name = "docker_image",
    binary = ":app",
    ports = ["5000"],
    visibility = ["//visibility:public"],
)
workspace(name = "test_bazel_repo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Bazel Skylib
http_archive(
    name = "bazel_skylib",
    sha256 = "060426b186670beede4104095324a72bd7494d8b4e785bf0d84a612978285908",
    strip_prefix = "bazel-skylib-1.4.1",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.4.1.tar.gz"],
)

# Bazel Rules Docker
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "27d53c1d646fc9537a70427ad7b034734d08a9c38924cc6357cc973fed300820",
    strip_prefix = "rules_docker-0.24.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/refs/tags/v0.24.0.tar.gz"],
)

# Bazel Skylib (required for various rules)
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.4.2.tar.gz"],
    strip_prefix = "bazel-skylib-1.4.2",
    sha256 = "2f6bfb47b65ed17ecde73d5352e4cb3fd66ef8b7284e28e601a9c3a4b8e0b71f",
)

# rules_go
http_archive(
    name = "io_bazel_rules_go",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/v0.42.0/rules_go-v0.42.0.tar.gz"],
    sha256 = "2c27a1c45f610622e028ee95b705265c205b27caa6c6e2aa373d58b108d680e5",
)

http_archive(
    name = "bazel_gazelle",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.32.0/bazel-gazelle-v0.32.0.tar.gz"],
    sha256 = "0fcf7d472edb6b2270a7c87a93c5df497b91e7b12f0a6076f0861bdf0b747ce9",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()
go_register_toolchains()


# ✅ Correct usage for v0.24.0
load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")
container_repositories()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "python39_slim",
    registry = "index.docker.io",
    repository = "library/python",
    tag = "3.9-slim",
)
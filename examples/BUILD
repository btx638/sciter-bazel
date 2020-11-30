load("//third_party/sciter:sciter_rules.bzl", "cc_sciter_resource")

cc_binary(
    name = "hello_world",
    srcs = [
        "hello_world.cpp",
    ],
    deps = [
        "//third_party/sciter",
        ":hello_world_resource_lib"
    ])

cc_library(
    name = "hello_world_resource_lib",
    hdrs = [
        "hello_world_resource.h",
    ],
    strip_include_prefix = "/examples" # why do I need this
)

cc_sciter_resource(
    name = "hello_world_resource.h",
    root = "hello_world_resource",
    files = glob(["hello_world_resource/**/*"])
)

load("//third_party/sciter:sciter_rules.bzl", "cc_sciter_resource")

cc_binary(
    name = "hello_world",
    srcs = [
        "hello_world.cpp",
    ],
    deps = [
        "//third_party/sciter",
        ":resource_lib"
    ])

# globs the folder at root into sciter resource
# as name.h in name_lib
cc_sciter_resource(
    root = "hello_world_resource",
    name = "resource", 
    strip_include_prefix = "/examples"
)

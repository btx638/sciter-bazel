package(default_visibility = ["//visibility:public"])

load("@bazel_skylib//rules:native_binary.bzl", "native_binary")

cc_library(
    name = "sciter",
    deps = select({
        "@platforms//os:windows": [":sciter_windows"],
        "//conditions:default": [], # non-windows not supported yet
    }),
)

cc_library(
    name = "sciter_windows",
    hdrs = glob(["include/**/*.h", "include/**/*.hpp"]),
    srcs = ["include/sciter-win-main.cpp"] + glob(["include/**/*.h", "include/**/*.hpp"]),
    defines = ["UNICODE"],
    deps = [":sciter_windows_dlls"],
    linkopts = [
        "user32.lib",
        "Shell32.lib",
        "ole32.lib",
        "msvcrt.lib",
        "kernel32.lib",
        "/ENTRY:wWinMainCRTStartup",
    ],
    strip_include_prefix = "/third_party/sciter/include",    
)

cc_library(
    name = "sciter_windows_dlls",
    srcs = select({
        "@platforms//cpu:x86_64": glob(["x64/*.dll"]),
        "@platforms//cpu:x86_32": glob(["x32/*.dll"])})
)
    
native_binary(name = "packfolder",
              src = select({
                  "@platforms//os:windows": "packfolder.exe",
                  # todo: other platforms
              }),
              out = select({
                  "@platforms//os:windows": "packfolder.exe",
                  # todo: other platforms
              })
)



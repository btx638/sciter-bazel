bazel config for a [Sciter](http://www.sciter.com) project

Currently only tested on Windows x64 and will need modifications to compile on other platforms

`hello_world` in `examples` folder shows how to link against the sciter dll and package the files in `examples/hello_world_resource` using sciter's `packfolder` 

To run the example, run `bazel run examples:hello_world`

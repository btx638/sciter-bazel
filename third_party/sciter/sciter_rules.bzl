def _impl(ctx):
    output_file = ctx.actions.declare_file(ctx.label.name)

    rel_paths = []

    root_len = len(ctx.file.root.path)
    for f in ctx.files.filegroup:
        if not f.path.startswith(ctx.file.root.path):
            fail("{} is not rooted at {}".format(f.path, ctx.file.root.path))
        rel_paths.append(f.path[root_len+1:]) # this strips off the prefix equal to root, plus leading slash

    ctx.actions.run(
        inputs = ctx.files.filegroup,
        outputs = [output_file],
        arguments = [ctx.file.root.path, output_file.path, "-i", ";".join(rel_paths)],
        executable = ctx.executable.packfolder)
    return [
        DefaultInfo(files = depset([output_file])),
    ]

cc_sciter_resource = rule(
    implementation = _impl,
    attrs = {
        "root": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "filegroup": attr.label(
            mandatory = True),
        "packfolder": attr.label(
            default = Label("//third_party/sciter:packfolder"),
            executable = True,
            cfg = "exec"
        ),        
    }
)


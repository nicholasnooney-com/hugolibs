# hugolibs

A repo to hold libraries for use with Hugo. Each subdirectory is treated as a
separate library. This repo is inspired by
<https://github.com/gohugoio/hugo-mod-jslibs>.

## Types of Libraries

### NPM Package Libraries

The script `create-npm-lib` can assist in downloading NPM packages and uploading
them as individual libraries. See the script file for usage.

## Using in Hugo

The `create-*` scripts will download files and initialize a go module inside of
them. Inside a `config.toml` file, these folders can be included and mounted
into Hugo's virtual filesystem:

```toml
[module]
  [[module.imports]]
    path = "github.com/nnooney/hugolibs/feather-icons"

  [[module.imports.mounts]]
    source = "dist"
    target = "assets/feather-icons"
```

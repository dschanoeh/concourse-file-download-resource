# File Download Resource for Concourse

[![GitHub license](https://img.shields.io/github/license/dschanoeh/concourse-file-download-resource)](https://github.com/dschanoeh/concourse-file-download-resource/blob/main/LICENSE)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/dschanoeh/concourse-file-download-resource)
![Docker Pulls](https://img.shields.io/docker/pulls/dschanoeh/concourse-file-download-resource)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/dschanoeh/concourse-file-download-resource)

Check a remote file for changes in its sha1 checksum and download it.

## Installing
```yaml
resource_types:
  - name: file-download
    type: docker-image
    source:
      repository: dschanoeh/concourse-file-download-resource
      tag: latest
```

## Source Configuration

```yaml
sources:
  - name: file-download
    type: file-download
    source:
      url: https://foo.bar/baz
      fileName: baz
```

* `url` (required) the URL of the file to check/download
* `fileName` (required) the local file name under which the file shall be downloaded
* `user` and `password` (optional) if provided, will be used for basic auth when downloading the file

## Behavior

### `check`: Check for changes of the file
Downloads the file, computes the sha1 checksum and returns it as version output.

### `in`: Download the file
Downloads the file and makes it available under `fileName` in the output folder.

### `out`: Not supported

# Bard Lab research

## Build site

To build the website locally, it is now recommended to use the included dockerfile.

1. Install Docker Desktop (https://www.docker.com/products/docker-desktop)
2. cd to the root directory of the repository
3. Run the following command in the terminal to build the docker container:
```bash ./.docker/run.sh```
4. Wait for docker to build the container and start the server.
5. The website should be available to preview at http://localhost:4000

## Contribute

Blog posts just require YAML top matter that looks something like:

```
---
layout: post
title: Stress granule presentation
author: Jared Bard
image: /images/blog/test.png
---
```

The `layout`, `title` and `author` tags are required, while `image` etc. is optional.  Just save a Markdown file with this top matter as something like `blog/_posts/2024-01-13-welcome.md`, where `2024-01-13` is the date of the post and `welcome` is the short title.  This short title is used in the URL of the post, so this becomes `blog/welcome/`, so the short title should be long enough and unique enough not to cause conflicts with other posts.

## For more information

* Look over the [metadata format guide](http://bardlab.org/guide/format/)
* Look over the [Markdown style guide](http://bardlab.org/guide/style/)

## License

All source code in this repository, consisting of files with extensions `.html`, `.css`, `.less`, `.rb` or `.js`, is freely available under an MIT license, unless otherwise noted within a file. You're welcome to borrow / repurpose code to build your own site, but I reccomend an  attribution and a link back to [bedford.io](http://bedford.io) from your `about` page.

**The MIT License (MIT)**

Copyright (c) 2024- Jared Bard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

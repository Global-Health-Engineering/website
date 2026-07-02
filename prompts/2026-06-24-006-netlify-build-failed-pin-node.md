---
id: 2026-06-24-006-netlify-build-failed-pin-node
timestamp: 2026-06-24T16:25:00+02:00
model: claude-opus-4-8
files_touched:
  - netlify.toml
  - .nvmrc
---

the netlify build failed: ❯ Warning: @quarto/netlify-plugin-quarto will be executed with Node.js version 22.23.0
3:45:55 PM:   The plugin cannot be executed with your defined Node.js version 18.20.8
3:45:55 PM: ​
3:45:55 PM:   Read more about our minimum required version in our forums announcement
3:45:55 PM: ​
3:45:55 PM: ❯ Loading plugins
3:45:55 PM:    - @quarto/netlify-plugin-quarto@0.0.5 from netlify.toml and package.json
3:45:57 PM: Failed during stage 'building site': Build script returned non-zero exit code: 2 (https://ntl.fyi/exit-code-2)
3:45:57 PM: ​
3:45:57 PM: Plugin "@quarto/netlify-plugin-quarto" failed                 
3:45:57 PM: ────────────────────────────────────────────────────────────────
3:45:57 PM: ​
3:45:57 PM:   Error message
3:45:57 PM:   HttpError: Error message
3:45:57 PM:   Invalid response body while trying to fetch https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest: Premature close
3:45:57 PM: ​
3:45:57 PM:   Plugin details
3:45:57 PM:   Package:        @quarto/netlify-plugin-quarto
3:45:57 PM:   Version:        0.0.5
3:45:57 PM:   Repository:     git+https://github.com/quarto-dev/netlify-plugin-quarto.git
3:45:57 PM:   npm link:       https://www.npmjs.com/package/@quarto/netlify-plugin-quarto
3:45:57 PM:   Report issues:  https://github.com/quarto-dev/netlify-plugin-quarto/issues
3:45:57 PM: ​
3:45:57 PM:   Error location
3:45:57 PM:   In "onPreBuild" event in "@quarto/netlify-plugin-quarto" from netlify.toml and package.json
3:45:57 PM: ​
3:45:57 PM:   Resolved config
3:45:57 PM:   build:
3:45:57 PM:     environment:
3:45:57 PM:       - REVIEW_ID
3:45:57 PM:     publish: /opt/build/repo/_site
3:45:57 PM:     publishOrigin: ui
3:45:57 PM:   plugins:
3:45:57 PM:     - inputs: {}
3:45:57 PM:       origin: config
3:45:57 PM:       package: "@quarto/netlify-plugin-quarto"
3:45:57 PM: Build failed due to a user error: Build script returned non-zero exit code: 2
3:45:57 PM: Failing build: Failed to build site
3:45:58 PM: Finished processing build request in 22.545s

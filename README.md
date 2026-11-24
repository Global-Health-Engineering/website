# Global Health Engineering: open science website

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8318442.svg)](https://doi.org/10.5281/zenodo.8318442)
[![License: CC BY
4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

<!-- badges: end -->

Source of <https://ghe-open.ch>, the open science website of the [Global Health Engineering group at ETH Zurich](https://ghe.ethz.ch/). The site holds slides of talks, tutorials, a blog and other open educational material of the group.

## What is where

| Folder | Content |
|---|---|
| `slides/` | One `.qmd` per talk, built as a reveal.js deck. `slides/index.qmd` is the slides page. |
| `_brand/` | Copy of the group's brand: colours, fonts and logos (`_brand.yml`, `logos/`). |
| `style/` | Rules the brand does not express: `theme.scss` for the site, `landing.scss` for the start page. |
| `slides/archive/` | Files that no page uses, kept for their history. |
| `tutorials/` | Tutorials, each with the date it was written. |
| `blog/` | Blog posts under `blog/posts/`. |
| `prompts/` | Archive of the prompts behind commits that were made with an AI assistant. Not part of the site. |
| `open-science/` | A draft of 2023 for a page on ghe.ethz.ch. Not part of the site. |
| `_freeze/` | Stored results of the R code in decks and posts. |

## How the site is built

The site is a [Quarto](https://quarto.org) website. Netlify builds it from the branch `main` with the Quarto plugin named in `netlify.toml`.

Netlify does not run R. Code in decks and posts is run on a laptop, and the results are stored in `_freeze/` and committed. After a change to a file with R code, render that file locally and commit the changed files under `_freeze/` together with it. A source file that no longer matches its stored result makes the build fail.

To preview the site locally:

``` bash
quarto preview
```

## How to change the site

1. Work on the branch `dev`.
2. Open a pull request from `dev` into `main`. Netlify builds a preview of the pull request and posts its address in the checks.
3. Merge with a merge commit, so the history of each file stays readable.

## Rules that hold for every change

- **Dated material stays.** Talks, posts and tutorials keep their text and their address. The data package tutorial of 9 June 2023 is kept as it was written; a note at its top says so.
- **Every public page carries the Plausible script.** It is set once in `_quarto.yml`, outside the `format:` block, and reaches every page and every deck. A deck does not carry a script of its own.
- **The brand is a copy.** `_brand/` holds `_brand.yml` and the four SVG logos of the [Global Health Engineering brand](https://github.com/Global-Health-Engineering/brand), copied from its release v0.1.0 (the draft of 16 November 2026). Change colours, fonts and logos in the brand repository first, publish a release there, then copy the files here and name the release in this line. No colour value is written into the files under `style/`.
- **Decks keep their look.** Quarto applies the brand to every format, so each reveal.js deck in `slides/` has `brand: false` in its front matter. A new deck needs the same line, or its own brand.
- **The workshops on the start page come from the aboutme package.** The R chunk in `index.qmd` reads the workshop entries of [aboutme](https://github.com/larnsce/aboutme), the same source as the CV. After a change to the workshops there, install the package, render `index.qmd` locally and commit the changed files under `_freeze/index/`.
- **Only listed files become pages.** The `render:` list in `_quarto.yml` names them.

## History

- Until June 2024 the site was served by GitHub Pages at `global-health-engineering.github.io/website/`. That address is no longer served. Three blog posts of 2023 link to their citation block there; those links are dead and the posts are kept as written.
- The folder `1-slides/` of 2023 is now `slides/`. Netlify redirects the old address.
- Tag `history/docs-github-pages`: the last commit that changed `docs/`, the rendered output of the site on GitHub Pages. The folder was removed in November 2026.
- Tag `history/data-package-2023-06-15`: a commit of 15 June 2023 on the data package tutorial that was never merged.

## Licence

The content is available under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). To cite the site, use the DOI above.

# CTGuns Blocks

Discourse theme component for CTGuns.org's custom homepage, built on the native [Blocks API](https://github.com/discourse/discourse/pull/36810).

## Install

Admin -> Customize -> Themes -> Install -> "From a git repository" -> paste this repo's URL.

Then attach it to your active theme: Admin -> Customize -> Themes -> your theme -> Components tab -> enable "CTGuns Blocks".

## Layout

- `hero-blocks`: welcome banner (also sets the `ctguns-custom-homepage` body class) + search bar + category cards
- `homepage-blocks`: latest discussions table, Watch & Listen cards, CTA banner
- `sidebar-blocks`: latest events (stub), hot topics, top weekly contributors

Default left nav sidebar is hidden on this route only, via `body.ctguns-custom-homepage .sidebar-wrapper { display: none; }` in `common/common.scss`.

## Known gaps

- `latest-events.gjs` is a placeholder. Needs wiring to the discourse-calendar / discourse-post-event plugin's data once confirmed available on this site.
- `watch-listen.gjs` episode list is hardcoded. Move to a `settings.yml` list or RSS feed once real episodes are picked.
- Full-width CSS on `.ctguns-watch-listen` / `.ctguns-cta-banner` (`grid-column: 1 / -1`) assumes `homepage-blocks` and `sidebar-blocks` share a CSS grid parent in core markup — verify on-site.

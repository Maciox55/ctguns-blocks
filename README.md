# CTGuns Blocks

Discourse theme component for CTGuns.org's custom homepage, built on the native [Blocks API](https://github.com/discourse/discourse/pull/36810).

## Install

Admin -> Customize -> Themes -> Install -> "From a git repository" -> paste this repo's URL.

Then attach it to your active theme: Admin -> Customize -> Themes -> your theme -> Components tab -> enable "CTGuns Blocks".

## Layout

- `hero-blocks`: welcome banner + category cards
- `homepage-blocks`: latest discussions list
- `sidebar-blocks`: latest events (stub), hot topics, top weekly contributors

## Known gaps

- `latest-events.gjs` is a placeholder. Needs wiring to the discourse-calendar / discourse-post-event plugin's data once confirmed available on this site.

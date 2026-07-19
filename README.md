# CTGuns Blocks

Discourse theme component for CTGuns.org's custom homepage, built on the native [Blocks API](https://github.com/discourse/discourse/pull/36810). Architecture and several blocks (leaderboard, upcoming events, home-link) are adapted from Discourse's own reference implementation: [discourse-theme-skills](https://github.com/discourse/discourse-theme-skills) (the source of meta.discourse.org's homepage).

## Install

1. Admin -> Customize -> Themes -> Install -> "From a git repository" -> paste this repo's URL. Install as a **component**.
2. Attach it to your active theme: Admin -> Customize -> Themes -> your theme -> Components tab -> enable "CTGuns Blocks".
3. Also install [Discourse Lucide Icons](https://meta.discourse.org/t/discourse-lucide-icons/400133) as a component on the same theme, so the icon names below render as Lucide instead of the closest Font Awesome match.

## Layout

| Outlet | Contents |
| --- | --- |
| `main-outlet-blocks` | Hero: welcome title, subtitle, search, join CTA. Only rendered on the homepage route (`HOMEPAGE` condition). |
| `homepage-blocks` | Category cards → Latest discussions → right column (upcoming events, hot topics, leaderboard, each gated by a plugin-enabled setting) → Watch & Listen → CTA banner. CSS grid with named areas, see `stylesheets/layouts/homepage.scss`. |
| `sidebar-blocks` | A single "Home" link back to `/custom`. This is Discourse's real left-nav sidebar outlet, **not** a homepage widget rail — putting widget-style content there is why the sidebar rendered blank in an earlier version of this theme. |

## Settings

| Setting | Default | Description |
| --- | --- | --- |
| `cta_link` | `/signup` | URL for the CTA banner button |
| `category_card_1/2/3` | `0` | Category ID for each homepage category card (`0` = hidden). Theme settings don't support a native category picker, so this is a plain ID field — find the ID in the category's edit-page URL. |
| `category_card_1/2/3_icon` | shield-check / circle-help / smartphone | Icon name for each card (Lucide name; needs the Discourse Lucide Icons component installed to render as Lucide) |
| `category_card_1/2/3_color` | 2dd4bf / f472b6 / f87171 | Hex color (no `#`) for each card's icon badge |

## Known gaps

- `block-watch-listen.gjs` episode list is hardcoded (no Discourse API for podcast/video content). Move to a `settings.yml` list or RSS feed once real episodes are picked.
- Upcoming events requires the discourse-post-event / discourse-calendar plugin; leaderboard requires the Discourse Gamification plugin with a "weekly" leaderboard configured server-side. Both blocks no-op cleanly (via `setting` conditions) if their plugin is absent.
- The `@container homepage-blocks (width > 800px)` two-column layout assumes core wraps the `homepage-blocks` outlet in a CSS container with that name (matching the discourse-theme-skills reference theme's own CSS, unmodified). Verify the two-column layout actually kicks in on-site.

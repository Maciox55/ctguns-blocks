# CTGuns Blocks

Discourse theme component for CTGuns.org's custom homepage, built on the native [Blocks API](https://github.com/discourse/discourse/pull/36810). Structure and styling verified directly against meta.discourse.org's live homepage (browser-inspected DOM, computed styles, and category model fields), not guessed.

## Install

1. Admin -> Customize -> Themes -> Install -> "From a git repository" -> paste this repo's URL. Install as a **component**.
2. Attach it to your active theme: Admin -> Customize -> Themes -> your theme -> Components tab -> enable "CTGuns Blocks".
3. **Required, can't be set from this theme**: Admin -> Settings -> search `enable_welcome_banner` -> turn it on. This is what gives the scroll-to-navbar search + navbar opacity behavior, for free, straight from Discourse core.
4. Optional: reword the banner text in Admin -> Customize -> Text -> search `welcome_banner.header` (keys: `anonymous_members`, `new_members`, `logged_in_members`). Theme locale files can't override these core (non-theme-prefixed) keys, so this has to be done in the admin UI, not in this repo.
5. Set `category_card_1/2/3` in this component's settings to the category IDs you want featured. Each card's icon and color come from that category's own settings (Admin -> Categories -> edit category), not from this theme.

## Architecture

| Outlet / mechanism | Contents |
| --- | --- |
| Core Welcome Banner | Title + search, scroll-to-navbar behavior — entirely core, not built by this theme. Scoped to the custom homepage only via a `welcome-banner-display-for-route` value transformer (`api-initializers/welcome-banner.gjs`), matching meta.discourse.org's own approach. |
| `homepage-blocks` | Category cards -> Latest discussions -> right column (upcoming events, hot topics, leaderboard — each gated by a plugin-enabled `setting` condition so they no-op cleanly if the plugin is absent). CSS grid with named areas, see `stylesheets/layouts/homepage.scss`. |
| `sidebar-blocks` | A single "Home" link back to `/custom`. This is Discourse's real left-nav sidebar outlet, **not** a homepage widget rail — putting widget-style content there renders blank. |

An earlier version of this theme hand-built its own hero/search/banner block and a "Watch & Listen" + CTA section. Both were removed once live inspection of meta.discourse.org showed neither exists there: the banner is 100% core, and Meta's homepage has no CTA or media section at all.

## Settings

| Setting | Default | Description |
| --- | --- | --- |
| `category_card_1/2/3` | `0` | Category ID for each homepage category card (`0` = hidden). Theme settings don't support a native category picker, so this is a plain ID field — find the ID in the category's edit-page URL. |

## Known gaps

- Upcoming events requires the discourse-post-event / discourse-calendar plugin; leaderboard requires the Discourse Gamification plugin with a "weekly" leaderboard configured server-side. Both blocks no-op cleanly (via `setting` conditions) if their plugin is absent.
- The `@container homepage-blocks (width > 800px)` two-column layout assumes core wraps the `homepage-blocks` outlet in a CSS container with that name (matching meta.discourse.org's own CSS). Verify the two-column layout actually kicks in on-site.
- Category icons (`category.icon`) are unknown ahead of time (whatever the site admin sets per category), so they aren't listed in `about.json`'s `svg_icons` subset — that's a bundle-size optimization only, not a hard requirement, so uncommon icons still render, just without the guaranteed-inclusion fast path.

import { apiInitializer } from "discourse/lib/api";

// Scope core's Welcome Banner to the custom homepage route only, matching
// meta.discourse.org's own approach (see their "Rebuilding the Meta Branded
// theme" post, PR discourse/discourse#37836). This still requires the
// `enable_welcome_banner` site setting to be turned on in Admin > Settings --
// that can't be set from a theme. Banner copy ("Welcome to CTGuns", "Welcome
// back, %{preferred_display_name}!") is reworded via Admin > Customize >
// Text overrides for the welcome_banner.header.* keys, not theme code --
// theme locale files can't override core (non-theme-prefixed) i18n keys.
export default apiInitializer((api) => {
  api.registerValueTransformer(
    "welcome-banner-display-for-route",
    ({ context }) => context.currentRouteName === "discovery.custom"
  );
});

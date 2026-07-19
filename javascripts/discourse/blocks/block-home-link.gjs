import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import dIcon from "discourse/helpers/d-icon";
import getURL from "discourse/lib/get-url";
import { i18n } from "discourse-i18n";

// Renders into the real left nav sidebar (sidebar-blocks outlet), not a
// homepage widget rail -- that's why widget-style blocks rendered blank
// there before. This is the correct content for this outlet.
@block("theme:ctguns:home-link", {
  description: "Sidebar link back to the custom homepage",
  args: {
    label: { type: "string", required: true },
  },
})
export default class BlockHomeLink extends Component {
  @service router;

  get isHomepage() {
    return this.router.currentRouteName === "discovery.custom";
  }

  <template>
    <ul class="sidebar-section-link-list" aria-label="Home">
      <li class="sidebar-section-link-wrapper">
        <a
          class="sidebar-section-link sidebar-row {{if this.isHomepage 'active'}}"
          href={{getURL "/custom"}}
        >
          <span class="sidebar-section-link-prefix icon">{{dIcon "house"}}</span>
          <span class="sidebar-section-link-content-text">{{i18n (themePrefix @label)}}</span>
        </a>
      </li>
    </ul>
  </template>
}

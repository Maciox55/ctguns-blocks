import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import dIcon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

// ponytail: icons cycle through this fixed list by index, since categories
// are dynamic (no per-category icon data available here). Names are Lucide
// names -- install the "Discourse Lucide Icons" theme component for them to
// actually render as Lucide instead of the closest Font Awesome match.
const ICONS = ["shield-check", "life-buoy", "book-open"];

@block("theme:ctguns:category-cards", {
  description: "Row of category quick-links with icons",
  args: {
    linkText: { type: "string" },
    count: { type: "number", default: 3 },
  },
})
export default class BlockCategoryCards extends Component {
  @service site;

  get categories() {
    return (this.site.categories || [])
      .slice(0, this.args.count || 3)
      .map((cat, i) => ({ cat, icon: ICONS[i % ICONS.length] }));
  }

  <template>
    <div class="block-category-cards__layout">
      {{#each this.categories as |entry|}}
        <a class="block-category-cards__card" href="/c/{{entry.cat.slug}}/{{entry.cat.id}}">
          {{dIcon entry.icon}}
          <span class="block-category-cards__name">{{entry.cat.name}}</span>
        </a>
      {{/each}}
    </div>
    <a class="block-category-cards__all" href="/categories">
      {{i18n (themePrefix @linkText)}}
      {{dIcon "arrow-right"}}
    </a>
  </template>
}

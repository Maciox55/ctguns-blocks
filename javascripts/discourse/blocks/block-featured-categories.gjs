import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import dIcon from "discourse/helpers/d-icon";
import Category from "discourse/models/category";
import { i18n } from "discourse-i18n";

// Cards are admin-picked via settings (category_card_1/2/3, category ID).
// Icon and color come straight from the category's own `.icon`/`.color`
// fields (Admin > Categories > edit category) -- matches meta.discourse.org's
// featured-categories block, and stays in sync with how the category badge
// looks everywhere else on the site instead of needing a second icon setting
// kept manually in step.
@block("theme:ctguns:category-cards", {
  description: "Row of admin-configured category quick-links with icons",
  args: {
    linkText: { type: "string" },
  },
})
function hexToRgb(hex) {
  const n = parseInt(hex, 16);
  // eslint-disable-next-line no-bitwise
  return `${(n >> 16) & 255}, ${(n >> 8) & 255}, ${n & 255}`;
}

export default class BlockCategoryCards extends Component {
  get cards() {
    return [settings.category_card_1, settings.category_card_2, settings.category_card_3]
      .filter((id) => id)
      .map((id) => Category.findById(parseInt(id, 10)))
      .filter(Boolean)
      .map((category) => ({ category, rgb: hexToRgb(category.color) }));
  }

  <template>
    {{#if this.cards}}
      <div class="block-featured-categories__layout">
        {{#each this.cards as |card|}}
          <a class="block-featured-categories__card" href="/c/{{card.category.slug}}/{{card.category.id}}">
            <div class="block-featured-categories__logo" style="color: #{{card.category.color}}; background-color: rgba({{card.rgb}}, 0.15)">
              {{dIcon card.category.icon}}
            </div>
            <div class="block-featured-categories__details">
              <h3 class="block-featured-categories__name">{{card.category.name}}</h3>
            </div>
          </a>
        {{/each}}
      </div>
      <a class="block-featured-categories__all-link" href="/categories">
        {{i18n (themePrefix @linkText)}}
        {{dIcon "arrow-right"}}
      </a>
    {{/if}}
  </template>
}

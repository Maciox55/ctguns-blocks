import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import dIcon from "discourse/helpers/d-icon";
import Category from "discourse/models/category";
import { i18n } from "discourse-i18n";

// Cards are admin-picked via settings (category_card_1/2/3 + matching
// _icon/_color settings), not auto-detected from site categories -- gives
// full control over which 3 show and how they look, instead of guessing.
@block("theme:ctguns:category-cards", {
  description: "Row of admin-configured category quick-links with icons",
  args: {
    linkText: { type: "string" },
  },
})
export default class BlockCategoryCards extends Component {
  get cards() {
    return [
      { id: settings.category_card_1, icon: settings.category_card_1_icon, color: settings.category_card_1_color },
      { id: settings.category_card_2, icon: settings.category_card_2_icon, color: settings.category_card_2_color },
      { id: settings.category_card_3, icon: settings.category_card_3_icon, color: settings.category_card_3_color },
    ]
      .filter((card) => card.id)
      .map((card) => ({ ...card, category: Category.findById(parseInt(card.id, 10)) }))
      .filter((card) => card.category);
  }

  <template>
    {{#if this.cards}}
      <div class="block-category-cards__layout">
        {{#each this.cards as |card|}}
          <a class="block-category-cards__card" href="/c/{{card.category.slug}}/{{card.category.id}}">
            <span class="block-category-cards__icon" style="background-color: #{{card.color}}">
              {{dIcon card.icon}}
            </span>
            <span class="block-category-cards__name">{{card.category.name}}</span>
          </a>
        {{/each}}
      </div>
      <a class="block-category-cards__all" href="/categories">
        {{i18n (themePrefix @linkText)}}
        {{dIcon "arrow-right"}}
      </a>
    {{/if}}
  </template>
}

import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import DButton from "discourse/components/d-button";
import dIcon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

@block("theme:ctguns:hero", {
  description: "Welcome banner with title, subtitle, search, and CTA button",
  args: {
    title: { type: "string", required: true },
    subtitle: { type: "string" },
    buttonLabel: { type: "string" },
    buttonLink: { type: "string" },
  },
})
export default class BlockHero extends Component {
  <template>
    <div class="block-hero__layout">
      <div class="block-hero__content">
        <h1 class="block-hero__title">
          {{i18n (themePrefix @title)}}
        </h1>
        {{#if @subtitle}}
          <p class="block-hero__subtitle">
            {{i18n (themePrefix @subtitle)}}
          </p>
        {{/if}}
        <form class="block-hero__search" action="/search" method="get">
          {{dIcon "magnifying-glass"}}
          <input type="search" name="q" placeholder={{i18n (themePrefix "hero.search_placeholder")}} />
        </form>
        {{#if @buttonLink}}
          <DButton
            class="btn-primary block-hero__button"
            @href={{@buttonLink}}
            @translatedLabel={{i18n (themePrefix @buttonLabel)}}
          />
        {{/if}}
      </div>
    </div>
  </template>
}

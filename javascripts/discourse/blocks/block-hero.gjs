import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import DButton from "discourse/components/d-button";
import dIcon from "discourse/helpers/d-icon";
import { and, not } from "discourse/truth-helpers";
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
  @service currentUser;

  <template>
    <div class="block-hero__layout">
      <div class="block-hero__content">
        <h1 class="block-hero__title">
          {{#if this.currentUser}}
            {{i18n (themePrefix "hero.title_loggedin") username=this.currentUser.username}}
          {{else}}
            {{i18n (themePrefix @title)}}
          {{/if}}
        </h1>
        {{#if @subtitle}}
          <p class="block-hero__subtitle">
            {{i18n (themePrefix @subtitle)}}
          </p>
        {{/if}}
        <form class="block-hero__search" action="/search" method="get">
          <span class="block-hero__search-icon">{{dIcon "magnifying-glass"}}</span>
          <input type="search" name="q" placeholder={{i18n (themePrefix "hero.search_placeholder")}} />
          <button type="submit" class="block-hero__search-filter" aria-label={{i18n (themePrefix "hero.search_filters")}}>
            {{dIcon "sliders-horizontal"}}
          </button>
        </form>
        {{#if (and @buttonLink (not this.currentUser))}}
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

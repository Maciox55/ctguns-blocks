import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import DButton from "discourse/components/d-button";
import { i18n } from "discourse-i18n";

@block("theme:ctguns:cta", {
  description: "Call-to-action banner with title, description, and button",
  args: {
    title: { type: "string", required: true },
    description: { type: "string" },
    buttonLabel: { type: "string" },
    buttonLink: { type: "string" },
  },
})
export default class BlockCta extends Component {
  <template>
    <div class="block-cta__layout">
      <div class="block-cta__text">
        <strong class="block-cta__title">{{i18n (themePrefix @title)}}</strong>
        {{#if @description}}
          <span class="block-cta__description">{{i18n (themePrefix @description)}}</span>
        {{/if}}
      </div>
      {{#if @buttonLink}}
        <DButton
          class="btn-primary block-cta__button"
          @href={{@buttonLink}}
          @translatedLabel={{i18n (themePrefix @buttonLabel)}}
        />
      {{/if}}
    </div>
  </template>
}

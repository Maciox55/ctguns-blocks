import Component from "@glimmer/component";
import { block } from "discourse/blocks";

@block("theme:ctguns:cta-banner", {
  args: {
    title: { type: "string" },
    subtitle: { type: "string" },
    buttonText: { type: "string" },
    buttonHref: { type: "string" },
  },
})
export default class CtaBanner extends Component {
  <template>
    <div class="ctguns-cta-banner">
      <div class="ctguns-cta-text">
        <strong>{{@title}}</strong>
        <span>{{@subtitle}}</span>
      </div>
      <a class="ctguns-cta-button" href={{@buttonHref}}>{{@buttonText}}</a>
    </div>
  </template>
}

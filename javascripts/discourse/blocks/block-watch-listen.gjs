import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import DButton from "discourse/components/d-button";
import dIcon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

// ponytail: episode list is hardcoded, no Discourse API for podcast/video
// content. Move to settings.yml (a list setting) or an RSS feed once real
// episodes are chosen.
const EPISODES = [
  { name: "Sam Saffron", tag: "Podcast", title: "What a Decade of Running Discourse Taught Sam Saffron About AI in Communities", href: "#" },
  { name: "Jeff Atwood", tag: "Video", title: "The complete guide to building your Online Community", href: "#" },
  { name: "Hawk", tag: "Podcast", title: "Why Online Communities Keep Falling Apart (And How to Fix Them)", href: "#" },
];

@block("theme:ctguns:watch-listen", {
  description: "Curated podcast/video episode cards",
  args: {
    title: { type: "string" },
  },
})
export default class BlockWatchListen extends Component {
  episodes = EPISODES;

  <template>
    <div class="block-watch-listen__layout">
      <h2 class="block-watch-listen__title">{{i18n (themePrefix @title)}}</h2>
      <div class="block-watch-listen__grid">
        {{#each this.episodes as |ep|}}
          <div class="block-watch-listen__card">
            {{dIcon "headphones"}}
            <span class="block-watch-listen__tag">{{ep.tag}}</span>
            <h4>{{ep.name}}</h4>
            <p>{{ep.title}}</p>
            <DButton class="btn-flat" @href={{ep.href}} @translatedLabel={{i18n (themePrefix "watch_listen.watch_now")}} />
          </div>
        {{/each}}
      </div>
    </div>
  </template>
}

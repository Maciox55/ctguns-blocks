import Component from "@glimmer/component";
import { block } from "discourse/blocks";

// ponytail: static placeholder cards. No Discourse API for podcast/video
// episodes -- wire to a settings.yml list (or an RSS feed) once real
// episodes are chosen.
const EPISODES = [
  {
    name: "Sam Saffron",
    tag: "Podcast",
    title: "What a Decade of Running Discourse Taught Sam Saffron About AI in Communities",
    avatar: "/images/avatar.png",
    href: "#",
  },
  {
    name: "Jeff Atwood",
    tag: "Video",
    title: "The complete guide to building your Online Community",
    avatar: "/images/avatar.png",
    href: "#",
  },
  {
    name: "Hawk",
    tag: "Podcast",
    title: "Why Online Communities Keep Falling Apart (And How to Fix Them)",
    avatar: "/images/avatar.png",
    href: "#",
  },
];

@block("theme:ctguns:watch-listen")
export default class WatchListen extends Component {
  episodes = EPISODES;

  <template>
    <div class="ctguns-watch-listen">
      <h2>Watch &amp; Listen</h2>
      <div class="ctguns-episode-cards">
        {{#each this.episodes as |ep|}}
          <a class="ctguns-episode-card" href={{ep.href}}>
            <img src={{ep.avatar}} alt={{ep.name}} />
            <span class="ctguns-episode-tag">{{ep.tag}}</span>
            <h4>{{ep.name}}</h4>
            <p>{{ep.title}}</p>
            <span class="ctguns-watch-now">Watch now &rarr;</span>
          </a>
        {{/each}}
      </div>
    </div>
  </template>
}

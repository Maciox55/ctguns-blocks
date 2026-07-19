import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { ajax } from "discourse/lib/ajax";
import { block } from "discourse/blocks";

@block("theme:ctguns:top-contributors")
export default class TopContributors extends Component {
  @tracked items = [];

  constructor() {
    super(...arguments);
    this.load();
  }

  async load() {
    const result = await ajax("/directory_items.json", {
      data: { period: "weekly", order: "likes_received" },
    });
    this.items = result.directory_items.slice(0, 5);
  }

  <template>
    <div class="ctguns-top-contributors">
      <h3>Best Weekly Contributors</h3>
      <ul>
        {{#each this.items as |item|}}
          <li>
            <a href="/u/{{item.user.username}}">{{item.user.username}}</a>
            <span>{{item.likes_received}}</span>
          </li>
        {{/each}}
      </ul>
    </div>
  </template>
}

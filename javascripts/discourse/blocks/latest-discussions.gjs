import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { ajax } from "discourse/lib/ajax";
import { block } from "discourse/blocks";

@block("theme:ctguns:latest-discussions")
export default class LatestDiscussions extends Component {
  @tracked topics = [];

  constructor() {
    super(...arguments);
    this.load();
  }

  async load() {
    const result = await ajax("/latest.json");
    this.topics = result.topic_list.topics.slice(0, 10);
  }

  <template>
    <div class="ctguns-latest-discussions">
      <h3>Latest Discussions</h3>
      <ul>
        {{#each this.topics as |topic|}}
          <li><a href="/t/{{topic.slug}}/{{topic.id}}">{{topic.title}}</a></li>
        {{/each}}
      </ul>
    </div>
  </template>
}

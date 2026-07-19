import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { ajax } from "discourse/lib/ajax";
import { block } from "discourse/blocks";

@block("theme:ctguns:hot-topics")
export default class HotTopics extends Component {
  @tracked topics = [];

  constructor() {
    super(...arguments);
    this.load();
  }

  async load() {
    const result = await ajax("/hot.json");
    this.topics = result.topic_list.topics.slice(0, 5);
  }

  <template>
    <div class="ctguns-hot-topics">
      <h3>Hot topics</h3>
      <ul>
        {{#each this.topics as |topic|}}
          <li><a href="/t/{{topic.slug}}/{{topic.id}}">{{topic.title}}</a></li>
        {{/each}}
      </ul>
    </div>
  </template>
}

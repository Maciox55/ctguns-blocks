import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { block } from "discourse/blocks";

@block("theme:ctguns:latest-discussions")
export default class LatestDiscussions extends Component {
  @service site;
  @tracked topics = [];

  constructor() {
    super(...arguments);
    this.load();
  }

  async load() {
    const result = await ajax("/latest.json");
    this.topics = result.topic_list.topics.slice(0, 12);
  }

  categoryName(categoryId) {
    return this.site.categories?.find((c) => c.id === categoryId)?.name;
  }

  // ponytail: minimal relative-time, swap for core's age helper if one is exposed to themes
  relativeTime(dateString) {
    const diffMs = Date.now() - new Date(dateString).getTime();
    const hours = Math.round(diffMs / 3_600_000);
    if (hours < 1) {
      return "just now";
    }
    if (hours < 24) {
      return `${hours}h`;
    }
    return `${Math.round(hours / 24)}d`;
  }

  <template>
    <div class="ctguns-latest-discussions">
      <h3>Latest Discussions</h3>
      <table>
        <thead>
          <tr>
            <th>Topic</th>
            <th>Views</th>
            <th>Activity</th>
          </tr>
        </thead>
        <tbody>
          {{#each this.topics as |topic|}}
            <tr>
              <td>
                <a href="/t/{{topic.slug}}/{{topic.id}}">{{topic.title}}</a>
                <span class="ctguns-topic-category">{{this.categoryName topic.category_id}}</span>
              </td>
              <td>{{topic.views}}</td>
              <td>{{this.relativeTime topic.last_posted_at}}</td>
            </tr>
          {{/each}}
        </tbody>
      </table>
    </div>
  </template>
}

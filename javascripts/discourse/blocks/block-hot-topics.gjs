import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import AsyncContent from "discourse/components/async-content";
import { bind } from "discourse/lib/decorators";
import { i18n } from "discourse-i18n";

@block("theme:ctguns:hot-topics", {
  description: "Compact list of hot topics",
  args: {
    title: { type: "string" },
    count: { type: "number", default: 5 },
  },
})
export default class BlockHotTopics extends Component {
  @service store;

  @bind
  async fetchTopics() {
    const topicList = await this.store.findFiltered("topicList", { filter: "hot" });
    if (!topicList.topics?.length) {
      return null;
    }
    return topicList.topics.slice(0, this.args.count || 5);
  }

  <template>
    <AsyncContent @asyncData={{this.fetchTopics}}>
      <:loading>
        <div class="block-hot-topics__loading"><div class="spinner" /></div>
      </:loading>

      <:empty>
        <div class="block-hot-topics__empty">{{i18n "topics.none.latest"}}</div>
      </:empty>

      <:content as |topics|>
        <div class="block-hot-topics__layout">
          {{#if @title}}
            <h2 class="block-hot-topics__title">{{i18n (themePrefix @title)}}</h2>
          {{/if}}
          <ul class="block-hot-topics__list">
            {{#each topics as |topic|}}
              <li><a href={{topic.url}}>{{topic.title}}</a></li>
            {{/each}}
          </ul>
        </div>
      </:content>
    </AsyncContent>
  </template>
}

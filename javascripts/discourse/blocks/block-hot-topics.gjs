import Component from "@glimmer/component";
import { service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import { block } from "discourse/blocks";
import AsyncContent from "discourse/components/async-content";
import categoryLink from "discourse/helpers/category-link";
import dIcon from "discourse/helpers/d-icon";
import replaceEmoji from "discourse/helpers/replace-emoji";
import { bind } from "discourse/lib/decorators";
import { i18n } from "discourse-i18n";

@block("theme:ctguns:hot-topics", {
  description: "Compact list of hot topics with category badge",
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
        <section class="block-hot-topics">
          <header class="block-hot-topics__header">
            <span class="block-hot-topics__header-icon" aria-hidden="true">{{dIcon "flame"}}</span>
            {{#if @title}}
              <h3 class="block-hot-topics__title">{{i18n (themePrefix @title)}}</h3>
            {{/if}}
          </header>

          <div class="block-hot-topics__body">
            <ul class="block-hot-topics__list">
              {{#each topics as |topic|}}
                <li class="block-hot-topics__item">
                  <div class="block-hot-topics__item-title">
                    <a href={{topic.url}} class="block-hot-topics__topic-link">
                      {{htmlSafe (replaceEmoji topic.fancy_title)}}
                    </a>
                  </div>
                  <div class="block-hot-topics__meta">
                    <span class="block-hot-topics__category">
                      {{categoryLink topic.category}}
                    </span>
                  </div>
                </li>
              {{/each}}
            </ul>
          </div>
        </section>
      </:content>
    </AsyncContent>
  </template>
}

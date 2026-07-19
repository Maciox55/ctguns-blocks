import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import AsyncContent from "discourse/components/async-content";
import BasicTopicList from "discourse/components/basic-topic-list";
import DButton from "discourse/components/d-button";
import { bind } from "discourse/lib/decorators";
import { i18n } from "discourse-i18n";

@block("theme:ctguns:latest-discussions", {
  description: "Latest topics list with heading and link",
  args: {
    title: { type: "string" },
    linkText: { type: "string" },
    linkUrl: { type: "string" },
    count: { type: "number", default: 12 },
  },
})
export default class BlockLatestDiscussions extends Component {
  @service store;

  @bind
  async fetchTopics() {
    const topicList = await this.store.findFiltered("topicList", { filter: "latest" });
    if (!topicList.topics?.length) {
      return null;
    }
    return topicList.topics.slice(0, this.args.count || 12);
  }

  <template>
    <AsyncContent @asyncData={{this.fetchTopics}}>
      <:loading>
        <div class="block-latest-discussions__loading"><div class="spinner" /></div>
      </:loading>

      <:empty>
        <div class="block-latest-discussions__empty">
          {{i18n "topics.none.latest"}}
        </div>
      </:empty>

      <:content as |topics|>
        <div class="block-latest-discussions__layout">
          {{#if @title}}
            <div class="block-latest-discussions__header">
              <h2 class="block-latest-discussions__title">
                {{i18n (themePrefix @title)}}
              </h2>
              {{#if @linkUrl}}
                <DButton
                  class="btn-flat block-latest-discussions__link"
                  @href={{@linkUrl}}
                  @translatedLabel={{i18n (themePrefix @linkText)}}
                />
              {{/if}}
            </div>
          {{/if}}
          <div class="block-latest-discussions__card">
            <BasicTopicList @topics={{topics}} @showPosters="true" />
          </div>
        </div>
      </:content>
    </AsyncContent>
  </template>
}

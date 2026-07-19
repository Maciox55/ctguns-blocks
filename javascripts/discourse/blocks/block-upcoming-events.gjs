import Component from "@glimmer/component";
import { block } from "discourse/blocks";
import AsyncContent from "discourse/components/async-content";
import dIcon from "discourse/helpers/d-icon";
import { ajax } from "discourse/lib/ajax";
import { bind } from "discourse/lib/decorators";
import { or } from "discourse/truth-helpers";
import { i18n } from "discourse-i18n";

// Requires the discourse-post-event / discourse-calendar plugin. Markup
// matches meta.discourse.org's live block-upcoming-events exactly (verified
// via browser inspection): a card-link per event with a stacked month/day
// badge, no separate long-date text or per-event button.
@block("theme:ctguns:upcoming-events", {
  description: "Upcoming events from discourse-post-event plugin",
  args: {
    title: { type: "string" },
    count: { type: "number", default: 5 },
  },
})
export default class BlockUpcomingEvents extends Component {
  @bind
  async fetchEvents() {
    const count = this.args.count || 5;
    const results = await ajax("discourse-post-event/events");
    if (!results.events?.length) {
      return null;
    }
    return results.events.slice(0, count);
  }

  getMonth(startsAt) {
    return new Date(startsAt).toLocaleDateString("en-US", { month: "short" }).toUpperCase();
  }

  getDay(startsAt) {
    return new Date(startsAt).getDate();
  }

  <template>
    <AsyncContent @asyncData={{this.fetchEvents}}>
      <:loading>
        <div class="block-upcoming-events__loading"><div class="spinner" /></div>
      </:loading>

      <:empty>
        <div class="block-upcoming-events__empty">
          {{i18n "discourse_post_event.events_list.empty"}}
        </div>
      </:empty>

      <:content as |events|>
        <section class="block-upcoming-events">
          <header class="block-upcoming-events__header">
            <span class="block-upcoming-events__header-icon" aria-hidden="true">{{dIcon "calendar"}}</span>
            {{#if @title}}
              <h3 class="block-upcoming-events__title">{{i18n (themePrefix @title)}}</h3>
            {{/if}}
          </header>

          <div class="block-upcoming-events__body">
            {{#each events as |event|}}
              <a class="block-upcoming-events__event" href={{event.post.url}}>
                <div class="block-upcoming-events__date-badge" aria-hidden="true">
                  <span class="block-upcoming-events__date-badge-month">{{this.getMonth event.starts_at}}</span>
                  <span class="block-upcoming-events__date-badge-day">{{this.getDay event.starts_at}}</span>
                </div>
                <h4 class="block-upcoming-events__event-title">
                  {{or event.name event.post.topic.title}}
                </h4>
              </a>
            {{/each}}
          </div>
        </section>
      </:content>
    </AsyncContent>
  </template>
}

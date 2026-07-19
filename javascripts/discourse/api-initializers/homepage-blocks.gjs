import BlockGroup from "discourse/blocks/builtin/block-group";
import { apiInitializer } from "discourse/lib/api";
import BlockCategoryCards from "../blocks/block-category-cards";
import BlockCta from "../blocks/block-cta";
import BlockHotTopics from "../blocks/block-hot-topics";
import BlockLatestDiscussions from "../blocks/block-latest-discussions";
import BlockLeaderboard from "../blocks/block-leaderboard";
import BlockUpcomingEvents from "../blocks/block-upcoming-events";
import BlockWatchListen from "../blocks/block-watch-listen";

export default apiInitializer((api) => {
  api.renderBlocks("homepage-blocks", [
    {
      block: BlockCategoryCards,
      id: "category-cards",
      args: {
        linkText: "category_cards.link_text",
      },
    },
    {
      block: BlockLatestDiscussions,
      id: "latest-discussions",
      args: {
        title: "homepage.latest_discussions.title",
        linkText: "homepage.latest_discussions.link_text",
        linkUrl: "/latest",
        count: 12,
      },
    },
    {
      block: BlockGroup,
      id: "homepage-right",
      children: [
        {
          block: BlockUpcomingEvents,
          id: "homepage-events",
          args: {
            title: "homepage.events.title",
            count: 5,
            buttonLabel: "homepage.events.button_label",
            linkLabel: "homepage.events.link_label",
            linkUrl: "/upcoming-events",
          },
          conditions: {
            type: "setting",
            name: "calendar_enabled",
            enabled: true,
          },
        },
        {
          block: BlockHotTopics,
          id: "homepage-hot-topics",
          args: {
            title: "homepage.hot_topics.title",
            count: 5,
          },
        },
        {
          block: BlockLeaderboard,
          id: "homepage-leaderboard",
          args: {
            title: "homepage.leaderboard.title",
            count: 8,
            buttonLabel: "homepage.leaderboard.button_label",
          },
          conditions: {
            type: "setting",
            name: "discourse_gamification_enabled",
            enabled: true,
          },
        },
      ],
    },
    {
      block: BlockWatchListen,
      id: "watch-listen",
      args: {
        title: "watch_listen.title",
      },
    },
    {
      block: BlockCta,
      id: "cta-banner",
      args: {
        title: "homepage.cta.title",
        description: "homepage.cta.description",
        buttonLabel: "homepage.cta.button_label",
        buttonLink: settings.cta_link,
      },
    },
  ]);
});

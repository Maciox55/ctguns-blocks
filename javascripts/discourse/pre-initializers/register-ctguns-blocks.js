import { withPluginApi } from "discourse/lib/plugin-api";
import BlockHero from "../blocks/block-hero";
import BlockCategoryCards from "../blocks/block-category-cards";
import BlockLatestDiscussions from "../blocks/block-latest-discussions";
import BlockHotTopics from "../blocks/block-hot-topics";
import BlockWatchListen from "../blocks/block-watch-listen";
import BlockCta from "../blocks/block-cta";
import BlockLeaderboard from "../blocks/block-leaderboard";
import BlockUpcomingEvents from "../blocks/block-upcoming-events";
import BlockHomeLink from "../blocks/block-home-link";

export default {
  before: "freeze-block-registry",
  initialize() {
    withPluginApi((api) => {
      api.registerBlock(BlockHero);
      api.registerBlock(BlockCategoryCards);
      api.registerBlock(BlockLatestDiscussions);
      api.registerBlock(BlockHotTopics);
      api.registerBlock(BlockWatchListen);
      api.registerBlock(BlockCta);
      api.registerBlock(BlockLeaderboard);
      api.registerBlock(BlockUpcomingEvents);
      api.registerBlock(BlockHomeLink);
    });
  },
};

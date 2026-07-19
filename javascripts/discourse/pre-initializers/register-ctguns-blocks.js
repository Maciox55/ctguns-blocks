import { withPluginApi } from "discourse/lib/plugin-api";
import BlockCategoryCards from "../blocks/block-featured-categories";
import BlockLatestDiscussions from "../blocks/block-latest-discussions";
import BlockHotTopics from "../blocks/block-hot-topics";
import BlockLeaderboard from "../blocks/block-leaderboard";
import BlockUpcomingEvents from "../blocks/block-upcoming-events";
import BlockHomeLink from "../blocks/block-home-link";

export default {
  before: "freeze-block-registry",
  initialize() {
    withPluginApi((api) => {
      api.registerBlock(BlockCategoryCards);
      api.registerBlock(BlockLatestDiscussions);
      api.registerBlock(BlockHotTopics);
      api.registerBlock(BlockLeaderboard);
      api.registerBlock(BlockUpcomingEvents);
      api.registerBlock(BlockHomeLink);
    });
  },
};

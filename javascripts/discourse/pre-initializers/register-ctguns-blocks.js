import { withPluginApi } from "discourse/lib/plugin-api";
import WelcomeBanner from "../blocks/welcome-banner";
import CategoryCards from "../blocks/category-cards";
import LatestDiscussions from "../blocks/latest-discussions";
import HotTopics from "../blocks/hot-topics";
import TopContributors from "../blocks/top-contributors";
import LatestEvents from "../blocks/latest-events";

export default {
  before: "freeze-block-registry",
  initialize() {
    withPluginApi((api) => {
      api.registerBlock(WelcomeBanner);
      api.registerBlock(CategoryCards);
      api.registerBlock(LatestDiscussions);
      api.registerBlock(HotTopics);
      api.registerBlock(TopContributors);
      api.registerBlock(LatestEvents);
    });
  },
};

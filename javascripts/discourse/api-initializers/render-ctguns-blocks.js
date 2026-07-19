import { withPluginApi } from "discourse/lib/plugin-api";
import WelcomeBanner from "../blocks/welcome-banner";
import CategoryCards from "../blocks/category-cards";
import LatestDiscussions from "../blocks/latest-discussions";
import HotTopics from "../blocks/hot-topics";
import TopContributors from "../blocks/top-contributors";
import LatestEvents from "../blocks/latest-events";

export default {
  initialize() {
    withPluginApi((api) => {
      api.renderBlocks("hero-blocks", [
        { block: WelcomeBanner },
        { block: CategoryCards },
      ]);

      api.renderBlocks("homepage-blocks", [
        { block: LatestDiscussions },
      ]);

      api.renderBlocks("sidebar-blocks", [
        { block: LatestEvents },
        { block: HotTopics },
        { block: TopContributors },
      ]);
    });
  },
};

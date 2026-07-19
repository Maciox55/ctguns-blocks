import { withPluginApi } from "discourse/lib/plugin-api";
import WelcomeBanner from "../blocks/welcome-banner";
import SearchBar from "../blocks/search-bar";
import CategoryCards from "../blocks/category-cards";
import LatestDiscussions from "../blocks/latest-discussions";
import WatchListen from "../blocks/watch-listen";
import CtaBanner from "../blocks/cta-banner";
import HotTopics from "../blocks/hot-topics";
import TopContributors from "../blocks/top-contributors";
import LatestEvents from "../blocks/latest-events";

export default {
  initialize() {
    withPluginApi((api) => {
      api.renderBlocks("hero-blocks", [
        { block: WelcomeBanner },
        { block: SearchBar },
        { block: CategoryCards },
      ]);

      api.renderBlocks("homepage-blocks", [
        { block: LatestDiscussions },
        { block: WatchListen },
        {
          block: CtaBanner,
          args: {
            title: "Secure by Design:",
            subtitle: "Our free guide to building privacy-focused communities",
            buttonText: "Download your copy",
            buttonHref: "/t/secure-by-design-guide",
          },
        },
      ]);

      api.renderBlocks("sidebar-blocks", [
        { block: LatestEvents },
        { block: HotTopics },
        { block: TopContributors },
      ]);
    });
  },
};

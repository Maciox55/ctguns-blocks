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
  before: "freeze-block-registry",
  initialize() {
    withPluginApi((api) => {
      api.registerBlock(WelcomeBanner);
      api.registerBlock(SearchBar);
      api.registerBlock(CategoryCards);
      api.registerBlock(LatestDiscussions);
      api.registerBlock(WatchListen);
      api.registerBlock(CtaBanner);
      api.registerBlock(HotTopics);
      api.registerBlock(TopContributors);
      api.registerBlock(LatestEvents);
    });
  },
};

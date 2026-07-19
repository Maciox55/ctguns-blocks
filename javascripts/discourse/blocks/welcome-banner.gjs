import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";

@block("theme:ctguns:welcome-banner")
export default class WelcomeBanner extends Component {
  @service currentUser;

  <template>
    <div class="ctguns-welcome-banner">
      <h1>Welcome back, {{this.currentUser.username}}!</h1>
    </div>
  </template>
}

import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";
import bodyClass from "discourse/helpers/body-class";

@block("theme:ctguns:welcome-banner")
export default class WelcomeBanner extends Component {
  @service currentUser;

  <template>
    {{bodyClass "ctguns-custom-homepage"}}
    <div class="ctguns-welcome-banner">
      <h1>Welcome back, {{this.currentUser.username}}!</h1>
    </div>
  </template>
}

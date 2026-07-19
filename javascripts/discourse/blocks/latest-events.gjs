import Component from "@glimmer/component";
import { block } from "discourse/blocks";

// ponytail: placeholder, needs discourse-calendar/discourse-post-event
// plugin's event data - wire up once that plugin's API is confirmed on this site.
@block("theme:ctguns:latest-events")
export default class LatestEvents extends Component {
  <template>
    <div class="ctguns-latest-events">
      <h3>Latest events</h3>
      <p>Coming soon</p>
    </div>
  </template>
}

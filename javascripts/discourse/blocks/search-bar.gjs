import Component from "@glimmer/component";
import { block } from "discourse/blocks";

@block("theme:ctguns:search-bar")
export default class SearchBar extends Component {
  <template>
    <form class="ctguns-search-bar" action="/search" method="get">
      <input type="search" name="q" placeholder="Search" />
      <button type="submit" aria-label="Search">&#128269;</button>
    </form>
  </template>
}

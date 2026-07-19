import Component from "@glimmer/component";
import { service } from "@ember/service";
import { block } from "discourse/blocks";

@block("theme:ctguns:category-cards")
export default class CategoryCards extends Component {
  @service site;

  get categories() {
    return (this.site.categories || []).slice(0, 3);
  }

  <template>
    <div class="ctguns-category-cards">
      {{#each this.categories as |cat|}}
        <a class="ctguns-category-card" href="/c/{{cat.slug}}/{{cat.id}}">
          <span class="ctguns-category-icon" style="background-color: #{{cat.color}}"></span>
          <span class="ctguns-category-name">{{cat.name}}</span>
        </a>
      {{/each}}
    </div>
    <a class="ctguns-all-categories" href="/categories">All categories &rarr;</a>
  </template>
}

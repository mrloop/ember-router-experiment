import { pageTitle } from 'ember-page-title';
import { fn, hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';
import Component from '@glimmer/component';
import { service } from '@ember/service';
import { on } from '@ember/modifier';

export default class extends Component {
  @service router;

  get queryParams() {
    return this.router.currentRoute?.queryParams ?? {};
  }

  get filteredArticles() {
    let articles = this.args.model;
    let category = this.queryParams.category;

    if (category) {
      return articles.filter((article) => article.category === category);
    } else {
      return articles;
    }
  }

  updateCategory = (category) => {
    this.router.transitionTo({
      queryParams: {
        ...this.queryParams,
        category,
      },
    });
  };

  <template>
    {{pageTitle "Articles"}}

    <LinkTo @route="articles" @query={{hash category=""}}>Everything</LinkTo>

    <LinkTo @route="articles" @query={{hash category="fauna"}}>Fauna</LinkTo>

    <LinkTo @route="articles" @query={{hash category="flora"}}>Flora</LinkTo>

    <button {{on "click" (fn this.updateCategory "flora")}} type="button">Action
      Flora</button>

    <ul>
      {{#each this.filteredArticles as |article|}}
        <li>{{article.name}}</li>
      {{/each}}
    </ul>

    {{outlet}}
  </template>
}

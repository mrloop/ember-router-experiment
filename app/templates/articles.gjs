import { pageTitle } from 'ember-page-title';
import { hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';
import Component from '@glimmer/component';
import { service } from '@ember/service';

export default class extends Component {
  @service router;

  get filteredArticles() {
    let category = this.router.currentRoute?.queryParams?.category;
    let articles = this.args.model;

    if (category) {
      return articles.filter((article) => article.category === category);
    } else {
      return articles;
    }
  }

  <template>
    {{pageTitle "Articles"}}

    <LinkTo @route="articles" @query={{hash category=""}}>Everything</LinkTo>

    <LinkTo @route="articles" @query={{hash category="fauna"}}>Fauna</LinkTo>

    <LinkTo @route="articles" @query={{hash category="flora"}}>Flora</LinkTo>

    <ul>
      {{#each this.filteredArticles as |article|}}
        <li>{{article.name}}</li>
      {{/each}}
    </ul>

    {{outlet}}
  </template>
}

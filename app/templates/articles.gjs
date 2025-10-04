import { pageTitle } from 'ember-page-title';
import { hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';
import Component from '@glimmer/component';

export default class extends Component {
  get filteredArticles() {
    let category = this.args.controller.category;
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

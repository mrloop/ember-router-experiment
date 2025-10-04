import { pageTitle } from 'ember-page-title';
import { hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';

<template>
  {{pageTitle "Articles"}}

  <LinkTo @route="articles" @query={{hash category=""}}>Everything</LinkTo>

  <LinkTo @route="articles" @query={{hash category="fauna"}}>Fauna</LinkTo>

  <LinkTo @route="articles" @query={{hash category="flora"}}>Flora</LinkTo>

  <ul>
    {{#each @controller.filteredArticles as |article|}}
      <li>{{article.name}}</li>
    {{/each}}
  </ul>

  {{outlet}}
</template>

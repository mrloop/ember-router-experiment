import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ArticlesController extends Controller {
  queryParams = ['category'];

  @tracked category = null;

  @tracked model;

  get filteredArticles() {
    console.log('get filteredArticles');
    let category = this.category;
    let articles = this.model;

    if (category) {
      console.log(category);
      return articles.filter((article) => article.category === category);
    } else {
      return articles;
    }
  }
}

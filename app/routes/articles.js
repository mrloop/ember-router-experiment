import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class ArticlesRoute extends Route {
  @service store;

  queryParams = {
    category: {
      refreshModel: true,
    },
  };

  model(params) {
    return [
      { name: 'bat', category: 'fauna' },
      { name: 'ash', category: 'flora' },
    ];
  }
}

'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-services)
 * to customize this service
 */

module.exports = {
  find(params, populate) {
    return strapi.query('metatheme-section').find(params, [
      'metathemes',
      'metathemes.metatheme_aethers',
      'metathemes.metatheme_aether_plans',
      'metathemes.metatheme_inclusions'
    ]);
  }
};

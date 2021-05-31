'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#lifecycle-hooks)
 * to customize this model
 */

module.exports = {
  lifecycles: {
    afterCreate(result, data) {
      strapi.services.servicelog.create({
        contentType: 'techresource',
        name: result.name || '',
        action: 'create',
        author: data._state || result.created_by,
        content: result
      })
    },
    afterUpdate(result, params, data) {
      strapi.services.servicelog.create({
        contentType: 'techresource',
        name: result.name || '',
        action: 'update',
        author: data._state || result.updated_by,
        content: result
      })
    },
    afterDelete(result, params) {
      strapi.services.servicelog.create({
        contentType: 'techresource',
        name: result.name || '',
        action: 'delete',
        author: strapi.currentUser || result.updated_by,
        content: result
      })
    }
  }
};

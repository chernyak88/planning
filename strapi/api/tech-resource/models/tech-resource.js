'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#lifecycle-hooks)
 * to customize this model
 */

module.exports = {
  lifecycles: {
    afterCreate(result, data) {
      if (data._state) {
        strapi.services.syslog.create({
          contentType: 'techresource',
          name: result.name || '',
          action: 'create',
          author: data._state.user.email || data._state.user.username,
          content: result
        })
      }
    },
    async beforeUpdate(params, data) {
      let contentBeforeUpdate = await strapi.query('tech-resource').findOne({id: params.id});
      data.contentBeforeUpdate = contentBeforeUpdate;
    },
    afterUpdate(result, params, data) {
      if (data._state) {
        strapi.services.syslog.create({
          contentType: 'techresource',
          name: result.name || '',
          action: 'update',
          author: data._state.user.email || data._state.user.username,
          content: result,
          contentBefore: data.contentBeforeUpdate
        })
      }
    },
    afterDelete(result, params) {
      strapi.services.syslog.create({
        contentType: 'techresource',
        name: result.name || '',
        action: 'delete',
        author: strapi.currentUser,
        content: result
      })
    }
  }
};

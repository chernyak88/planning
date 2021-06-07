module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        await next();
        if (ctx.request.method === 'GET' && !ctx.request.url.includes('/count') && ctx.req.user) {
          strapi.services.syslog.create({
            contentType: 'request',
            name: decodeURIComponent(ctx.request.url),
            action: 'get',
            author: ctx.req.user.email || ctx.req.user.username
          });
        };
      });
    }
  };
};

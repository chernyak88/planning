module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        await next();
        console.log(ctx);
        if (ctx.req.user) {
          strapi.services.servicelog.create({
            contentType: 'request',
            name: ctx.request.url,
            action: 'get',
            author: ctx.req.user.email || ctx.req.user.username
          })
        }
      });
    }
  };
};

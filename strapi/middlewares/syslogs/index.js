module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        const getIP = require('ipware')().get_ip;
        const ipInfo = getIP(ctx.req);
        await next();
        if (ctx.request.method === 'GET' && !ctx.request.url.includes('/count') && ctx.req.user) {
          strapi.services.syslog.create({
            contentType: 'request',
            name: ctx.request.url.split('?')[0],
            action: 'get',
            author: ctx.req.user.email || ctx.req.user.username
          });
        };
        if (ctx.request.method === 'DELETE' && ctx.req.user) {
          strapi.services.syslog.create({
            contentType: ctx.request.url,
            name: ctx.response.body.name || '',
            action: 'delete',
            author: ctx.req.user.email || ctx.req.user.username,
            content: ctx.response.body,
          });
        };
        if (ctx.request.method === 'POST' && ctx.request.url === '/auth/local') {
          strapi.services.syslog.create({
            contentType: 'auth',
            name: ipInfo.clientIp || '',
            action: 'login',
            author: ctx.response.body.user.email || ctx.response.body.user.username
          });
        };
      });
    }
  };
};

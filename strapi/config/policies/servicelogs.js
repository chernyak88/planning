module.exports = async (ctx, next) => {
  if (ctx.is('multipart')) {
    const data = JSON.parse(ctx.request.body.data);
    data._state = ctx.state;
    ctx.request.body.data = JSON.stringify(data);
    strapi.currentUser = JSON.stringify(data);
  } else {
    ctx.request.body._state = ctx.state;
    strapi.currentUser = ctx.state;
  }
  return await next();
};

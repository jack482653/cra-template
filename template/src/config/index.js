let config = {};

switch (process.env.REACT_APP_DIST_ENV) {
  case 'production':
    config = require('./production').default;
    break;
  case 'stage':
    config = require('./stage').default;
    break;
  default:
    config = require('./development').default;
    break;
}

export default config;

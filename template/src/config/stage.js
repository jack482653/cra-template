import baseConfig from './base';

const config = {
  appEnv: 'stage' // feel free to remove the appEnv property here
};

export default Object.freeze(Object.assign({}, baseConfig, config));

require('babel-register');
require('babel-polyfill');

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: { //<--- you should run testrpc from scripts
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*',
      gas: 10000000
    }
  }
};

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }
  }
};


// const fs = require('fs');
// const HD = require('truffle-hdwallet-provider');
// const {mnemonic} = JSON.parse(fs.readFileSync('secrets.json','utf8'));
// module.exports = {
//   // See <http://truffleframework.com/docs/advanced/configuration>
//   // for more about customizing your Truffle configuration
//   networks: {
//     development: {
//       provider:() => new HD(mnemonic , 'http://localhost:7545'),
//       // host: "127.0.0.1",
//       // port: 8545,
//       network_id: "*" // Match any network id
//     }
//   }
// };

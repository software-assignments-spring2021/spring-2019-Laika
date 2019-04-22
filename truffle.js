var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = ""
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/1a58d05198c348d9b29d5dd96913279d")
      },
      network_id: 4,
      gas: 3000000,
      gasPrice: 10000000000
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

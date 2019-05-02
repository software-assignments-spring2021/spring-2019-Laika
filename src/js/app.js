App = {
  web3Provider: null,
  contracts: {},
  init: function () {
    // Load pets.
    $.getJSON('../pets.json', function (data) {
      var petsRow = $('#petsRow');
      var petTemplate = $('#petTemplate');

      for (i = 0; i < data.length; i++) {
        petTemplate.find('.panel-title').text(data[i].name);
        petTemplate.find('img').attr('src', data[i].picture);
        petTemplate.find('.pet-breed').text(data[i].breed);
        petTemplate.find('.pet-age').text(data[i].age);
        petTemplate.find('.pet-location').text(data[i].location);
        petTemplate.find('.btn-adopt').attr('data-id', data[i].id);
        petsRow.append(petTemplate.html());
      }
    }
  return App.initWeb3();
},

  initWeb3: function() {
    return App.initWeb3();
  },
  // init: async function() {
  //   // Load pets.
  //   $.getJSON('../pets.json', function(data) {
  //     var petsRow = $('#petsRow');
  //     var petTemplate = $('#petTemplate');
  //
  //     for (i = 0; i < data.length; i ++) {
  //       petTemplate.find('.panel-title').text(data[i].name);
  //       petTemplate.find('img').attr('src', data[i].picture);
  //       petTemplate.find('.pet-breed').text(data[i].breed);
  //       petTemplate.find('.pet-cost').text(data[i].cost);
  //       petTemplate.find('.pet-location').text(data[i].location);
  //       petTemplate.find('.btn-adopt').attr('data-id', data[i].id);
  //       petTemplate.find('.btn-adopt').on("click",function(){
  //         //call metamask
  //       });
  //
  //       petsRow.append(petTemplate.html());
  //     }
  //   });
  //
  //   return await App.initWeb3();
  // },

  // initWeb3: async function() {
  //     // Modern dapp browsers...
  //     if (window.ethereum) {
  //         App.web3Provider = window.ethereum;
  //         try {
  //             // Request account access
  //             await window.ethereum.enable();
  //         } catch (error) {
  //             // User denied account access...
  //             console.error("User denied account access")
  //         }
  //     }
  //     // Legacy dapp browsers...
  //     else if (window.web3) {
  //         App.web3Provider = window.web3.currentProvider;
  //     }
  //     // If no injected web3 instance is detected, fall back to Ganache
  //     else {
  //         App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
  //     }
  //     web3 = new Web3(App.web3Provider);
  //
  //     return App.initContract();
  // },
  initWeb3: function () {
    // get web3.js - exp: Chrome w. MetaMask provides its own web3.js
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
    } else {
      // if no browser web3 instance is found, use web3.js in ganache
      //�NOTE: not suitable for production!
      // NOTE: web3Provider=null is member of App
      App3.web3Provider = new
        Web3.providers.HttpProvider('http://localhost:8545');
    }

    // initialize contract by App function below
    return App.initContract();
  },
  initContract: function () {
    // get contract artifact file - instantiate it with truffle-contract
    // artifacts is a JSON file containing contract's deployed address
    // and ABI file (like IDL signatures file)
    $.getJSON('Adoption.json', (data) => {
      var AdoptionArtifact = data;

      // pass the retrieved artifacts to TruffleContract to instantiate it
      // NOTE: contracts={} is a member of App
      App.contracts.Adoption = TruffleContract(AdoptionArtifact);

      // once contract is instantiated, set the provider for the contract
      // NOTE: web3Provider=null is member of App
      App.contracts.Adoption.setProvider(App.web3Provider);

      // use contract to retrieve petId, see if the pet is already adopted,
      // and if not, mark the pet as adopted
      // see App.markedAdopted() below
      return App.markAdopted();
    });

    return App.bindEvents();
  },

  bindEvents: function () {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },


  markAdopted: function (adopters, account) {
    var adoptionInstance;

    // deploy the instantiated contract - when deployed get the 'instance'
    // address of the deployed contract - set adoptionInstance with it
    App.contracts.Adoption.deployed().then(function (instance) {
      adoptionInstance = instance;

      // using call() allows us to read from the blockchain without sending
      // a full transaction - so no gas cost
      // return the collection of adopters and after promise resolution
      // iterate through them
      return adoptionInstance.getAdopters.call();
    }).then(function (adopters) {
      // check for all adoptors to see if address is non-trivial, i.e. not
      // 0x000 (assigned by Solidity to each array on initialization)
      // If the address in NOT 0x000 then the pet has already been adopted,
      // so disable its adopt button, and change the button text to 'Success'
      for (i = 0; i < adopters.length; i++) {
        if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
          $('.panel-pet').eq(i).find('button');
        }
      }
    }).catch(function (err) {
      console.log(err.message);
    });
  },

  handleAdopt: function (event) {
    event.preventDefault();
    var petId = parseInt($(event.target).data('id'));
    var adoptionInstance;

    // use web3 to get the user's accounts - if no error, set var account
    // to the first account (the one used in ganache)
    web3.eth.getAccounts(function (error, accounts) {
      if (error) {
        console.log(error);
      }
      var account = accounts[0];

      // deploy the instantiated contract - when deployed get the 'instance'
      // address of the deployed contract - set adoptionInstance with it
      App.contracts.Adoption.deployed().then(function (instance) {
        adoptionInstance = instance;

        // different from App.markedAdopted which used call(), this time we
        // send a transaction (so pay gas fees)
        // Thus we need a 'from' account from which to take the gas fee
        // in addition to the petId of the pet desired to be adopted
        // adopt sends the transaction
        // the resolved Promise returns the transaction object 'result'
        return adoptionInstance.adopt(petId, { from: account });
      }).then(function (result) {
        // sync the UI with the new adoption - i.e mark pet as adopted
        return App.markAdopted();
      }).catch(function (err) {
        console.log(err.message);
      });
    });
  }

};//App

$(function () {
  $(window).load(function () {
    App.init();
  });
});

Notes to integrate front end with back end

Dependencies:
1. truffle
2. ganache
3. metamask
4. lite-server

On Termial:
1. cd into repo root
2. npm install
3. truffle compile
4. (NOT A COMMAND OPEN THE APP ) -> launch ganache
5. truffle migrate

On Ganache:
1. Click on your accounts
2. Check what RPC SERVER your config is set to (This will be your local net) EG: Mine is  HTTP://127.0.0.1:7545
3. Click on the Key icon and save your private key to one of your wallets ex: 123456789123456789

On Meta Mask in Chrome:
1. Click on custom RPC
2. Go to New Network and type your RPC from Ganache: EG: http://localhost:7545
3. Click on the ball circle looking thing on the right hand corner and click on import account
4. Type your private key then click import


On Front end:
0. Npm run dev
1. Go to Market place
2. Click on an item  - click select - should change to 'success' - may need to refresh browser
3. Confirm transaction on metamask
4. Look at transaction history on Ganache

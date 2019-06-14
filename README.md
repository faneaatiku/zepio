# BZWallet | BZEdge Wallet

BZWallet is a Sapling-enabled shielded-address-first BZEdge wallet, featuring cross-platform applications (macOS, Windows and Linux), built-in full node with support for `dark` and `light` themes.

### [Latest Documentation](https://github.com/bze-alphateam/BZWallet/wiki)

### [Latest Release](https://github.com/bze-alphateam/BZWallet/releases)

![BZEdge Wallet](https://raw.githubusercontent.com/bze-alphateam/Official-BZEdge-Graphics/master/Digital-Web/Wallet/BZWallet_Color_Black.png)

## Stack Information

List of the main open source libraries and technologies used in building **BZWallet**:

- [BZEdge](https://github.com/bze-alphateam/bzedge): BZEdge node daemon
- [Zepio](https://github.com/ZcashFoundation/zepio): Zepio | ZEC wallet
- [Electron](https://github.com/electron/electron): Desktop application builder
- [React](https://facebook.github.io/react/): User interface view layer
- [Redux](https://redux.js.org/): Predictable application state container
- [Styled Components](https://www.styled-components.com/): Visual primitives for theming and styling applications
- [webpack](https://webpack.github.io/): Application module bundler (and more)
- [Babel](https://babeljs.io/): ES7/JSX transpilling
- [ESLint](https://eslint.org/): Code linting rules
- [Flow](https://flow.org): JavaScript static type checker
- [Docz](https://docz.site): Documentation builder
- [BigNumber.js](https://github.com/MikeMcl/bignumber.js#readme): Arbitrary-precision decimal and non-decimal arithmetic with safety

## Installing and Running From Source

To run **BZWallet** from source you'll need to perform the following steps:
```bash
# Ensure you have Node LTS v8+
# https://nodejs.org/en/

# Clone Codebase
git clone git@github.com:bze-alphateam/BZWallet.git

# Install Dependencies
# inside of the `BZWallet` folder
yarn install
# OR
npm install

# Start Application
# webpack development server hosts the application on port
# 8080 and launches the Electron wrapper, which also hosts
# the `bzedged` node daemon process.
yarn start
# OR
npm start
```

## Building Application Locally

To build the application locally follow the instructions below:
```bash
# Make sure you are inside of the main `BZWallet` folder

# Run Build Script
yarn electron:distall

# Executables and binaries available under `/dist` folder
```

## Flow Coverage (Static Type Checker)

For a deeper look on the static typing coverage of the application, please follow below:
```bash
# Make sure you are inside of the main `BZWallet` folder

# Generate Flow Coverage Report
# this can take a couple seconds
yarn flow:report

# Browser should open with the file `index.html` opened
# Files are also available at `BZWallet/flow-coverage/source`
```

## Component Library (Docz)

To see BZWallet's React component library, please visit https://zepio-components.now.sh. We're always looking for folks to help keep the styleguide updated.

To run the component library locally, run the following:
```bash
# Make sure you are inside of the main `BZWallet` folder

# Run Docz Development Script
yarn docz:dev

# Visit http://127.0.0.1:4000/
```

To build the component library locally, run the following:
```bash
# Make sure you are inside of the main `BZWallet` folder

# Run Build Script
yarn docz:build

# Check `/.docz/dist` folder for built static assets
```

## Tests

To run the application's tests, please run the below:
```bash
# Make sure you are inside of the main `BZWallet` folder

# For Unit Tests: Run Jest Unit Test Suite
yarn test:unit

# For E2E (end-to-end) Tests: Run Jest E2E Suite
yarn e2e:serve
# on another terminal window
yarn test e2e
```

## Contributing

In order to contribute and submit PRs to improve **BZWallet** or **Zepio** codebase, please check our [CONTRIBUTING](https://github.com/bze-alphateam/BZWallet/blob/master/CONTRIBUTING.md) guide.

## License

MIT © Zcash Foundation 2019 [zfnd.org](zfnd.org)

MIT © BZE Alpha Team 2019 [getbze.com](getbze.com)

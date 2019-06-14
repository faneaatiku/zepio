// @flow

import got from 'got';

type Payload = {
  [currency: string]: number,
};

/**
  WARNING:
  Just a super fast way to get the zec price
*/
// eslint-disable-next-line
export default (currencies: string[] = ['USD']): Promise<Payload> => new Promise((resolve, reject) => {
  const ENDPOINT = 'https://getbze.com/api/price/usd';

  got(ENDPOINT)
    .then(response => resolve(response.body))
    .catch(reject);
});

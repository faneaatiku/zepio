import { isTestnet } from '../../config/is-testnet';

export const getCoinName = () => (isTestnet() ? 'TAZ' : 'BZE');

// @flow
import React from 'react';
import { LIGHT, THEME_MODE } from '../constants/themes';
import electronStore from '../../config/electron-store';

export const ZcashLogoWhite = () => {
  const themeInStore = String(electronStore.get(THEME_MODE));
  let img = 'https://raw.githubusercontent.com/bze-alphateam/Official-BZEdge-Graphics/master/Digital-Web/Wallet/BZWallet_Color_White.png';
  if (themeInStore === LIGHT) {
    img = 'https://raw.githubusercontent.com/bze-alphateam/Official-BZEdge-Graphics/master/Digital-Web/Wallet/BZWallet_Color_Black.png';
  }

  return (
    <img vspace='5' hspace='7' width='170px' style={{ padding: '15px !important' }} src={img} alt='BZWallet' />
  );
};

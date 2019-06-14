// @flow

import path from 'path';
import os from 'os';

import { app } from '../electron'; // eslint-disable-line

export const locateZcashConf = () => {
  if (os.platform() === 'darwin') {
    return path.join(app.getPath('appData'), 'Bzedge', 'bzedge.conf');
  }

  if (os.platform() === 'linux') {
    return path.join(app.getPath('home'), '.bzedge', 'bzedge.conf');
  }

  return path.join(app.getPath('appData'), 'Bzedge', 'bzedge.conf');
};

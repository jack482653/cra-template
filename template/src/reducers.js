import {combineReducers} from '@reduxjs/toolkit';
import appSlice from 'containers/application/slice';

export default combineReducers({
  app: appSlice.reducer
});

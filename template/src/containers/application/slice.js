import {createSlice} from '@reduxjs/toolkit';

export default createSlice({
  name: 'app',
  initialState: {
    loading: 0
  },
  reducers: {
    startLoading: (state) => {
      state.loading += 1;
    },
    finishLoading: (state) => {
      state.loading -= 1;
    }
  }
});

import {createSelector} from 'reselect';

export const selectLoading = createSelector(
  (state) => state.app.loading,
  (loading) => loading > 0
);

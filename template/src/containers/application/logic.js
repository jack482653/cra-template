import slice from './slice';

export function startLoading() {
  return slice.actions.startLoading();
}

export function finishLoading() {
  return slice.actions.finishLoading();
}
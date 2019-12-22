import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer.js';

export const configureStore = (preloadedState = {}) => {
  return createStore(rootReducer, preloadedState);
}
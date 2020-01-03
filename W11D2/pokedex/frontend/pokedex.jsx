import React from 'react';
import ReactDOM from 'react-dom';
// import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    window.store = store;
    window.requestAllPokemon = requestAllPokemon;
    const rootEl = document.getElementById('root');
    window.selectAllPokemon = selectAllPokemon;
    ReactDOM.render(<Root store={store}/>, rootEl);
});
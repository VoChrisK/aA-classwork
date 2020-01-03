import * as APIUtil from '../util/api_util';

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
});

export const receiveAPokemon = poke => ({
    type: RECEIVE_A_POKEMON,
    poke
});

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestAPokemon = poke => dispatch => (
    APIUtil.fetchAPokemon(poke)
        .then(poke => dispatch(receiveAPokemon(poke)))
);


export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_A_POKEMON = 'RECEIVE_A_POKEMON';
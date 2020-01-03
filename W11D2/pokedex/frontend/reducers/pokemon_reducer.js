import { RECEIVE_ALL_POKEMON, RECEIVE_A_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState;
    switch(action.type){
        case RECEIVE_ALL_POKEMON:
            nextState = Object.assign({}, state, action.pokemon);
            return nextState;
        case RECEIVE_A_POKEMON:
            nextState = Object.assign({}, state, action.poke);
            return nextState;
        default: 
            return state;
        
    }
};

export default pokemonReducer;

import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    switch(action.type){
        case RECEIVE_ALL_POKEMON:
            const nextState = Object.assign({}, action.pokemon);
            return nextState;
        default: 
            return state;
        
    }
};

export default pokemonReducer;

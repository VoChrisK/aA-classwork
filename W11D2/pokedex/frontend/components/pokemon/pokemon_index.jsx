import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
    constructor(props){
        super(props);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render(){
        const pokemonItems = this.props.pokemon.map(poke => (
                <PokemonIndexItem key={poke.id} pokemon={poke} />

        ));
        return(
                <section className="pokedex">
                    <ol className="poke-list">{pokemonItems}</ol>
                </section>
        )
    }

    
}

export default PokemonIndex;
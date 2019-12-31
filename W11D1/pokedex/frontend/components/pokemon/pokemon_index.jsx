import React from 'react';

class PokemonIndex extends React.Component {
    constructor(props){
        super(props);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render(){
        return(
            <ul>
                {
                    this.props.pokemon.map((poke, idx) => {
                        return (
                        <li key={idx}>
                            {poke.name}
                                <img src={poke.image_url} width="50" height="50"/>
                        </li>
                    )})
                }
            </ul>
        )
    }

    
}

export default PokemonIndex;
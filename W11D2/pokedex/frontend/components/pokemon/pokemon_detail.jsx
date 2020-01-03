import React from 'react';

class PokemonDetail extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.requestAPokemon(this.props.id);
    }

    componentDidUpdate(prevProps) {
        if(prevProps.match.params.id !== this.props.id) {
            console.log(prevProps.match.params.id);
            this.props.requestAPokemon(this.props.id);
        }
    }

    render() {
        let { poke } = this.props
        if(!poke || !poke.moves) return null;

        return (
            <div className="pokemon-detail">
                <img src={poke.image_url} />
                <h1>{poke.name}</h1>
                <h3>Type: {poke.poke_type}</h3>
                <h3>Attack: {poke.attack}</h3>
                <h3>Defense: {poke.defense}</h3>
                <h3 className="moves">Moves:
                    {
                        poke.moves.map(move => <h3>{move} </h3>)
                    }
                </h3>
            </div>
        )
    }
};

export default PokemonDetail;
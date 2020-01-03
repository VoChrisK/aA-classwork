import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestAPokemon } from './../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
    let pokeId = ownProps.match.params.id
    return ({
        poke: state.entities.pokemon[pokeId],
        id: pokeId
    });
};

const mapDispatchToProps = dispatch => ({
    requestAPokemon: poke => {
        dispatch(requestAPokemon(poke))
    }
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonDetail);
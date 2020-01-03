export const selectAllPokemon = (state) => {
    const pokes = Object.values(state.entities)[0];
    return Object.keys(pokes).map(id => {
        return pokes[id];
    })
};

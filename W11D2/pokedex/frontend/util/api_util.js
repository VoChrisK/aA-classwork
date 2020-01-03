export const fetchAllPokemon = () => {
    return $.ajax({
        method: "GET",
        url: "api/pokemon"
    }) 
};

export const fetchAPokemon = poke_id => {
    return $.ajax({
        method: "GET",
        url: `api/pokemon/${poke_id}`
    }) 
}
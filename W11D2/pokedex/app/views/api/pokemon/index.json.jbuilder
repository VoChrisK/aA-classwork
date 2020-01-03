# json.array! @pokemons do |pokemon|
#     json.set! pokemon.id do
#         json.extract! pokemon, :id, :name, :image_url
#     end
# end

@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name
    json.image_url asset_path("pokemon_snaps/#{poke.image_url}")
  end
end
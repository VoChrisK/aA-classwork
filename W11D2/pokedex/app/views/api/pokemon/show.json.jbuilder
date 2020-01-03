json.set! @pokemon.id do
    json.extract! @pokemon,:id, :name, :attack, :defense, :moves, :poke_type, :item_ids, :items
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end
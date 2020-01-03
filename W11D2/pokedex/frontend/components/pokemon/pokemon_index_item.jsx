import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = props => (
    <Link to={`/pokemon/${props.pokemon.id}`}>
        <li className="poke-list-item">
            {props.pokemon.id}
            <img src={props.pokemon.image_url} width="20" height="20" />
            {props.pokemon.name}
        </li>
    </Link>
);

export default PokemonIndexItem;
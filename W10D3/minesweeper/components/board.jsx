import React from "react";
import Tile from "./tile";

class Board extends React.Component {
    constructor(props) {
        super(props) //maybe use object deconstruction here?
    }

    render() {
        return (
            <div className="board">
                {
                this.props.board.grid.map((row, idx1) => {
                    return ( <div key={idx1} className="row">
                        {
                        row.map((tile, idx2) => {
                            return ( <Tile key={idx2} tile={tile} updateGame={this.props.updateGame} /> ) 
                        })
                        } 
                    </div> )
                })
                }
            </div>
        )
    }
}

export default Board;
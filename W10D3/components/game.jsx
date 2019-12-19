import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board";

class Game extends React.Component {
    constructor() {
        super();
        this.state = {
            board: new Minesweeper.Board(10, 20)
        }

        this.updateGame = this.updateGame.bind(this);
        this.resetGame = this.resetGame.bind(this);
    }

    updateGame(tile, revealed) {
        if(!revealed) {
            tile.explore();
        } else {
            tile.toggleFlag();
        }

        this.setState({ board: this.state.board });
    }

    resetGame() {
        this.setState({board: new Minesweeper.Board(10, 20)});
    }

    render() {
        let text = "";
        let modalEl ="";
        if(this.state.board.won()) {
            text = "Congratulations, you win!";
        } else {
            text = "You lose! Too bad!"
        }

        if(this.state.board.won() || this.state.board.lost()) {
            modalEl = (
            <section id="modal" className="modal is-active">
                <article className="modal-content">
                    <span className="modal-close js-hide-modal">&times;</span>
                    {text}
                    <br />
                    <button onClick={this.resetGame}>Play Again</button>
                </article>
                <div className="modal-screen js-hide-modal"></div>
            </section>
            )
        }

        

        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
                {modalEl}
            </div>
        )
    }


}

export default Game;
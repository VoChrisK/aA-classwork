import React from "react";

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    render() {
        if(this.props.tile.bombed && this.props.tile.explored) {
            return (
            <div className="tile" onClick={() => {this.handleClick(event)}}>
                💣
            </div>
            )
        } else if(this.props.tile.explored) {
            return (
                <div className="tile revealed" onClick={() => { this.handleClick(event) }}>
                    {this.props.tile.adjacentBombCount()}
                </div>
            )
        } else if(this.props.tile.flagged) {
            return (
                <div className="tile" onClick={() => { this.handleClick(event) }}>
                    🚩
                </div>
            )
        } else {
            return (
                <div className="tile" onClick={() => { this.handleClick(event) }}>
                    
                </div>
            )
        }
    }

    handleClick(event) {
        this.props.updateGame(this.props.tile, event.altKey);
    }
}

export default Tile;
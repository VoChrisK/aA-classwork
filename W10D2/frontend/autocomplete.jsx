import React from 'react';

class Autocomplete extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inputVal: "",
            currentNames: props.names
        };

        this.autofill = this.autofill.bind(this);
        this.filterNames = this.filterNames.bind(this);
        this.resetNames = this.resetNames.bind(this);
    }

    changeNames(e) {
        e.target.value.length === 0 ? this.resetNames() : this.filterNames(e);
    }

    filterNames(e) {
        let filteredNames = this.getFilteredArray(this.state.currentNames, e.currentTarget.value);
        this.setState({inputVal: e.target.value, currentNames: filteredNames});
    }

    resetNames() {
        this.setState({ inputVal: "", currentNames: this.props.names });
    }

    autofill(e) {
        let filterNames = this.getFilteredArray(this.state.currentNames, e.currentTarget.innerHTML);
        this.setState({inputVal: e.currentTarget.innerHTML, currentNames: filterNames});
    }

    getFilteredArray(names, substr) {
        return names.filter(name => {
            return name.toLowerCase().startsWith(substr.toLowerCase());
        })
    }

    render() {
        return (
            <div className="autocomplete-widget widgets">
                <input type="text" onChange={ this.changeNames.bind(this) } value={this.state.inputVal}/>
                <ul className="names">
                    {
                        this.state.currentNames.map((name, idx) => {
                            return (
                                <li className="name" key={idx} onClick={this.autofill}>{name}</li>
                                )
                            })
                        }
                </ul>
            </div>
        )
    }
}

export default Autocomplete;
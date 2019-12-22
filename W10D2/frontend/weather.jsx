import React from 'react';

class Weather extends React.Component {
    constructor() {
        super();
        this.state = {
            location: {}
        }
        this.apiId = "7abb53a50d1d09463c487820a3f81dac";
    }

    componentWillMount() {
        const that = this;
        navigator.geolocation.getCurrentPosition(GeolocationPosition => {
            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if(this.readyState === 4) {
                    if(this.status >= 200 && this.status < 400) {
                        const newLocation = JSON.parse(this.response);
                        that.setState({location: newLocation});
                    } else {
                        console.log("Something went wrong!");
                    }
                }
            };
            
            const method = "GET";
            const { latitude, longitude } = GeolocationPosition.coords;
            const url = `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&APPID=${this.apiId}`;
            
            xhr.open(method, url);
            xhr.send();
        });
    }

    convertKelvinToFahrenheit(temp) {
        return (Math.round(((temp * 9 / 5) - 459.67) * 100) / 100) + "°F";
    }

    render() {
        if(Object.keys(this.state.location).length === 0) {
            return(
                <div className="weather">
                    <h2>Loading weather...</h2>
                </div>
            )
        } else {
            return(
                <div className="weather">
                    <h2>{this.state.location.name}</h2>
                    <h2>{this.convertKelvinToFahrenheit(this.state.location.main.temp)}</h2>
                </div>
            )
        }
    }
}

export default Weather;
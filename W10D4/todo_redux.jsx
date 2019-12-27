import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import configureStore from './frontend/store/store';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={configureStore} />, root);
})
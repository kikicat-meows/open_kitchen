import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();

  // testing_code_start_here
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // testing_code_end_here
  
  ReactDOM.render(<Root store={store}/>, root)
})
import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtil from './util/session_api_util';
import * as action from './actions/session_actions';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  window.signup = action.signup;
  window.login = action.login;
  window.logout = action.logout;
  window.store = configureStore();
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});

import React from 'react';
import { Link } from 'react-router-dom';


const Greeting = ({ currentUser, logout }) => {
  const personalGreeting = () => {
    return (
      <div>
        <h3>Greetings {currentUser.username}</h3>
        <button onClick={logout}>Logout</button>
      </div>
    );
  };

  const sessionLinks = () => (
    (
      <div>
        <Link replace to='/signup'>Sign Up</Link>
        <Link replace to='/login'>Log In</Link>
      </div>
    )
  );
  return currentUser ? personalGreeting() : sessionLinks();
};

export default Greeting;
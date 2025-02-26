import React, { useState } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [message, setMessage] = useState('');
  const [users, setUsers] = useState([]);

  const fetchMessage = async () => {
    try {
      const response = await axios.get('http://localhost:3000/salut/Loan');
      setMessage(response.data.message);
      setUsers(response.data.users);
      console.log(response.data.users);
    } catch (error) {
      console.error("Erreur lors de l'appel à l'API:", error);
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Appel à l'API Bun</h1>
        <button onClick={fetchMessage}>Appeler l'API</button>
        {message && <p>{message}</p>}
        {users.length > 0 && (
          <ul>
            {users.map((user) => (
              <li key={user.id}>{user.firstname} {user.lastname}</li>
            ))}
          </ul>
        )}
      </header>
    </div>
  );
}

export default App;

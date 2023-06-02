import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          id="env-link"
          href="https://fake-url.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          ~{ process.env.REACT_APP_TITLE_ENV }~
        </a>
      </header>
    </div>
  );
}

export default App;

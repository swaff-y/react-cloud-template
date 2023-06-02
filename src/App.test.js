import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  const app = render(<App />);
  const linkElement = app.container.querySelector('#env-link');
  expect(linkElement).toBeInTheDocument();
});

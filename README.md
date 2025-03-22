# Art Gallery - Art Movements Explorer

A modern web application built with Ruby on Rails and React that showcases different art movements throughout history. This application allows users to explore various art movements, view artworks, and learn about their historical significance.

## Features

- Browse different art movements
- View detailed information about each movement
- Explore artworks within each movement
- Learn about historical context and key artists
- Responsive design for all devices
- Interactive React components
- Real-time updates with WebSocket

## Requirements

- Ruby 3.2.0 or higher
- Rails 7.0.0 or higher
- PostgreSQL
- Node.js and Yarn
- React 18 or higher

## Setup

1. Clone the repository
2. Install backend dependencies:
   ```bash
   bundle install
   ```
3. Install frontend dependencies:
   ```bash
   cd frontend
   yarn install
   ```
4. Setup the database:
   ```bash
   rails db:create db:migrate
   ```
5. Start the development servers:
   ```bash
   # Terminal 1 - Rails API server
   rails s -p 3000
   
   # Terminal 2 - React development server
   cd frontend
   yarn dev
   ```

## Development

The application uses:
- Ruby on Rails 7 (API mode)
- PostgreSQL for the database
- React 18 for the frontend
- Vite for frontend build tooling
- Tailwind CSS for styling
- React Router for frontend routing
- Axios for API communication

## Project Structure

```
art-gallery/
├── api/           # Rails API backend
└── frontend/      # React frontend application
```

## License

MIT License

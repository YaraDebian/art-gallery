import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { ThemeProvider, CssBaseline } from '@mui/material'
import { createTheme } from '@mui/material/styles'
import Navbar from './components/Navbar'
import Home from './pages/Home'
import ArtMovements from './pages/ArtMovements'
import ArtMovementDetail from './pages/ArtMovementDetail'
import Artists from './pages/Artists'
import ArtistDetail from './pages/ArtistDetail'
import ArtworkDetail from './pages/ArtworkDetail'
import Artworks from './pages/Artworks'

const theme = createTheme({
  palette: {
    mode: 'light',
    primary: {
      main: '#1976d2',
    },
    secondary: {
      main: '#dc004e',
    },
  },
})

function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <Navbar />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/movements" element={<ArtMovements />} />
          <Route path="/movements/:id" element={<ArtMovementDetail />} />
          <Route path="/artists" element={<Artists />} />
          <Route path="/artists/:id" element={<ArtistDetail />} />
          <Route path="/artworks" element={<Artworks />} />
          <Route path="/artworks/:id" element={<ArtworkDetail />} />
        </Routes>
      </Router>
    </ThemeProvider>
  )
}

export default App

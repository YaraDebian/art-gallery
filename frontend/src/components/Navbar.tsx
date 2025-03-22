import { AppBar, Toolbar, Typography, Button, Container } from '@mui/material'
import { Link as RouterLink } from 'react-router-dom'

const Navbar = () => {
  return (
    <AppBar position="static">
      <Container>
        <Toolbar>
          <Typography variant="h6" component={RouterLink} to="/" sx={{ flexGrow: 1, textDecoration: 'none', color: 'inherit' }}>
            Art Gallery
          </Typography>
          <Button color="inherit" component={RouterLink} to="/movements">
            Art Movements
          </Button>
          <Button color="inherit" component={RouterLink} to="/artists">
            Artists
          </Button>
          <Button color="inherit" component={RouterLink} to="/artworks">
            Artworks
          </Button>
        </Toolbar>
      </Container>
    </AppBar>
  )
}

export default Navbar 
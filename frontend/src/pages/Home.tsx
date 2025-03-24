import { Container, Typography, Grid,  Box, CardActionArea, CardContent } from '@mui/material'
import { useNavigate } from 'react-router-dom'

const Home = () => {
  const navigate = useNavigate()
  return (
    <Container maxWidth="xl">
      <Box width="100%" gap={4} padding={4} >
        <Typography variant="h2" component="h1" gutterBottom align="center">
          Welcome to Art Gallery
        </Typography>
        <Typography variant="h5" component="h2" gutterBottom align="center" color="text.secondary">
          Explore the world of art through different movements, artists, and their masterpieces
        </Typography>

        <Grid container spacing={4} sx={{ mt: 4 }}>
          <Grid item xs={12} sm={6} md={4}>
            <CardActionArea onClick={() => navigate('/movements')}>
              <CardContent>
                <Typography variant="h5" align='center' gutterBottom>
                  Art Movements
                </Typography>
                <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                  Discover various art movements throughout history, from Renaissance to Modern Art.
                </Typography>
              </CardContent>
            </CardActionArea>
          </Grid>

          <Grid item xs={12} md={4}>
            <CardActionArea onClick={() => navigate('/artists')}>
              <CardContent>
                <Typography align='center' variant="h5" gutterBottom>
                  Artists
                </Typography>
                <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                  Learn about the lives and works of influential artists who shaped art history.
                </Typography>
              </CardContent>
            </CardActionArea>
          </Grid>

          <Grid item xs={12} md={4}>
            <CardActionArea onClick={() => navigate('/artworks')}>
              <CardContent>
                <Typography align='center' variant="h5" gutterBottom>
                  Artworks
                </Typography>
                <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                  Explore masterpieces and significant works that define different artistic periods.
                </Typography>
              </CardContent>
            </CardActionArea>
          </Grid>
        </Grid>
      </Box>
    </Container>
  )
}

export default Home 
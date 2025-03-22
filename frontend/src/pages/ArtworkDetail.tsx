import { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Container, Typography, Paper, Box, Button, Grid } from '@mui/material'
import axios from 'axios'

interface Artwork {
  id: number
  title: string
  description: string
  year: number
  image_url: string
  artist: {
    id: number
    name: string
    biography: string
  }
  art_movement: {
    id: number
    name: string
    description: string
  }
}

const ArtworkDetail = () => {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [artwork, setArtwork] = useState<Artwork | null>(null)

  useEffect(() => {
    const fetchArtwork = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/v1/artworks/${id}`)
        setArtwork(response.data)
      } catch (error) {
        console.error('Error fetching artwork:', error)
      }
    }

    fetchArtwork()
  }, [id])

  if (!artwork) {
    return (
      <Container>
        <Typography>Loading...</Typography>
      </Container>
    )
  }

  return (
    <Container>
      <Box sx={{ my: 4 }}>
        <Button
          variant="outlined"
          onClick={() => navigate(-1)}
          sx={{ mb: 2 }}
        >
          Back
        </Button>

        <Grid container spacing={4}>
          <Grid item xs={12} md={6}>
            <img
              src={artwork.image_url}
              alt={artwork.title}
              style={{ width: '100%', height: 'auto' }}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <Typography variant="h3" component="h1" gutterBottom>
              {artwork.title}
            </Typography>
            <Typography variant="h5" color="text.secondary" gutterBottom>
              by {artwork.artist.name}
            </Typography>
            <Typography variant="subtitle1" color="text.secondary" gutterBottom>
              {artwork.art_movement.name} • {artwork.year}
            </Typography>

            <Paper sx={{ p: 3, mb: 3 }}>
              <Typography variant="body1" paragraph>
                {artwork.description}
              </Typography>
            </Paper>

            <Paper sx={{ p: 3, mb: 3 }}>
              <Typography variant="h6" gutterBottom>
                About the Artist
              </Typography>
              <Typography variant="body1" paragraph>
                {artwork.artist.biography}
              </Typography>
              <Button
                variant="text"
                onClick={() => navigate(`/artists/${artwork.artist.id}`)}
              >
                View Artist Profile
              </Button>
            </Paper>

            <Paper sx={{ p: 3 }}>
              <Typography variant="h6" gutterBottom>
                Art Movement
              </Typography>
              <Typography variant="body1" paragraph>
                {artwork.art_movement.description}
              </Typography>
              <Button
                variant="text"
                onClick={() => navigate(`/movements/${artwork.art_movement.id}`)}
              >
                View Art Movement
              </Button>
            </Paper>
          </Grid>
        </Grid>
      </Box>
    </Container>
  )
}

export default ArtworkDetail 
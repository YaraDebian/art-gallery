import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { Container, Typography, Paper, Grid, Box } from '@mui/material'
import axios from 'axios'

interface ArtMovement {
  id: number
  name: string
  description: string
  period: string
  artworks: Array<{
    id: number
    title: string
    description: string
    year: number
    image_url: string
    artist: {
      id: number
      name: string
    }
  }>
}

const ArtMovementDetail = () => {
  const { id } = useParams<{ id: string }>()
  const [movement, setMovement] = useState<ArtMovement | null>(null)

  useEffect(() => {
    const fetchMovement = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/v1/art_movements/${id}`)
        setMovement(response.data)
      } catch (error) {
        console.error('Error fetching art movement:', error)
      }
    }

    fetchMovement()
  }, [id])

  if (!movement) {
    return (
      <Container>
        <Typography>Loading...</Typography>
      </Container>
    )
  }

  return (
    <Container>
      <Box sx={{ my: 4 }}>
        <Typography variant="h3" component="h1" gutterBottom>
          {movement.name}
        </Typography>
        <Typography variant="h5" color="text.secondary" gutterBottom>
          {movement.period}
        </Typography>
        
        <Paper sx={{ p: 3, mb: 4 }}>
          <Typography variant="body1" paragraph>
            {movement.description}
          </Typography>
        </Paper>

        <Typography variant="h4" gutterBottom>
          Notable Artworks
        </Typography>
        <Grid container spacing={4}>
          {movement.artworks.map((artwork) => (
            <Grid item xs={12} sm={6} md={4} key={artwork.id}>
              <Paper sx={{ p: 2 }}>
                <img
                  src={artwork.image_url}
                  alt={artwork.title}
                  style={{ width: '100%', height: 'auto', marginBottom: '1rem' }}
                />
                <Typography variant="h6" gutterBottom>
                  {artwork.title}
                </Typography>
                <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                  by {artwork.artist.name}
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  {artwork.year}
                </Typography>
              </Paper>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Container>
  )
}

export default ArtMovementDetail 
import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { Container, Typography, Paper, Grid, Box } from '@mui/material'
import axios from 'axios'

interface Artist {
  id: number
  name: string
  biography: string
  birth_date: string
  death_date: string | null
  artworks: Array<{
    id: number
    title: string
    description: string
    year: number
    image_url: string
    art_movement: {
      id: number
      name: string
    }
  }>
}

const ArtistDetail = () => {
  const { id } = useParams<{ id: string }>()
  const [artist, setArtist] = useState<Artist | null>(null)

  useEffect(() => {
    const fetchArtist = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/v1/artists/${id}`)
        setArtist(response.data)
      } catch (error) {
        console.error('Error fetching artist:', error)
      }
    }

    fetchArtist()
  }, [id])

  if (!artist) {
    return (
      <Container>
        <Typography>Loading...</Typography>
      </Container>
    )
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    })
  }

  return (
    <Container>
      <Box sx={{ my: 4 }}>
        <Typography variant="h3" component="h1" gutterBottom>
          {artist.name}
        </Typography>
        <Typography variant="h5" color="text.secondary" gutterBottom>
          {formatDate(artist.birth_date)}
          {artist.death_date ? ` - ${formatDate(artist.death_date)}` : ' - Present'}
        </Typography>
        
        <Paper sx={{ p: 3, mb: 4 }}>
          <Typography variant="body1" paragraph>
            {artist.biography}
          </Typography>
        </Paper>

        <Typography variant="h4" gutterBottom>
          Artworks
        </Typography>
        <Grid container spacing={4}>
          {artist.artworks.map((artwork) => (
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
                  {artwork.art_movement.name}
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

export default ArtistDetail 
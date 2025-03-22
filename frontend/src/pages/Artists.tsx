import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Container, Grid, Card, CardContent, Typography, CardActionArea, Box } from '@mui/material'
import axios from 'axios'

interface Artist {
  id: number
  name: string
  biography: string
  birth_date: string
  death_date: string | null
}

const Artists = () => {
  const [artists, setArtists] = useState<Artist[]>([])
  const navigate = useNavigate()

  useEffect(() => {
    const fetchArtists = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/v1/artists')
        setArtists(response.data)
      } catch (error) {
        console.error('Error fetching artists:', error)
      }
    }

    fetchArtists()
  }, [])

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
          Artists
        </Typography>
        <Grid container spacing={4}>
          {artists.map((artist) => (
            <Grid item xs={12} sm={6} md={4} key={artist.id}>
              <Card>
                <CardActionArea onClick={() => navigate(`/artists/${artist.id}`)}>
                  <CardContent>
                    <Typography variant="h5" component="h2" gutterBottom>
                      {artist.name}
                    </Typography>
                    <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                      {formatDate(artist.birth_date)}
                      {artist.death_date ? ` - ${formatDate(artist.death_date)}` : ' - Present'}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {artist.biography.substring(0, 150)}...
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Container>
  )
}

export default Artists 
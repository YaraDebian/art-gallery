import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Container, Grid, Card, CardContent, Typography, CardActionArea, Box } from '@mui/material'
import axios from 'axios'

interface ArtMovement {
  id: number
  name: string
  description: string
  period: string
}

const ArtMovements = () => {
  const [movements, setMovements] = useState<ArtMovement[]>([])
  const navigate = useNavigate()

  useEffect(() => {
    const fetchMovements = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/v1/art_movements')
        setMovements(response.data)
      } catch (error) {
        console.error('Error fetching art movements:', error)
      }
    }

    fetchMovements()
  }, [])

  return (
    <Container>
      <Box sx={{ my: 4 }}>
        <Typography variant="h3" component="h1" gutterBottom>
          Art Movements
        </Typography>
        <Grid container spacing={4}>
          {movements.map((movement) => (
            <Grid item xs={12} sm={6} md={4} key={movement.id}>
              <Card>
                <CardActionArea onClick={() => navigate(`/movements/${movement.id}`)}>
                  <CardContent>
                    <Typography variant="h5" component="h2" gutterBottom>
                      {movement.name}
                    </Typography>
                    <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                      {movement.period}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {movement.description.substring(0, 150)}...
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

export default ArtMovements 
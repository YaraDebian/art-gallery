import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Container, Grid, Card, CardContent, Typography, CardActionArea, Box } from '@mui/material';
import axios from 'axios';

interface Artwork {
  id: number;
  title: string;
  description: string;
  year: number;
  image_url: string;
  artist: {
    id: number;
    name: string;
  };
  art_movement: {
    id: number;
    name: string;
  };
}

const Artworks = () => {
  const [artworks, setArtworks] = useState<Artwork[]>([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchArtworks = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/v1/artworks');
        setArtworks(response.data);
      } catch (error) {
        console.error('Error fetching artworks:', error);
      }
    };

    fetchArtworks();
  }, []);

  return (
    <Container>
      <Box sx={{ my: 4 }}>
        <Typography variant="h3" component="h1" gutterBottom>
          Artworks
        </Typography>
        <Grid container spacing={4}>
          {artworks.map(artwork => (
            <Grid item xs={12} sm={6} md={4} key={artwork.id}>
              <Card>
                <CardActionArea onClick={() => navigate(`/artworks/${artwork.id}`)}>
                  <CardContent>
                    <img
                      src={artwork.image_url}
                      alt={artwork.title}
                      style={{ width: '100%', height: 'auto', marginBottom: '1rem' }}
                    />
                    <Typography variant="h5" component="h2" gutterBottom>
                      {artwork.title}
                    </Typography>
                    <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                      by {artwork.artist.name}
                    </Typography>
                    <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                      {artwork.art_movement.name}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {artwork.year}
                    </Typography>
                    <Typography variant="body2" color="text.secondary" sx={{ mt: 1 }}>
                      {artwork.description.substring(0, 100)}...
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Container>
  );
};

export default Artworks;

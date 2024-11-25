const express = require('express');
const router = express.Router();
const conexion = require('../database');

router.get('/', (req, res) => {
  const query = 'SELECT * FROM subredditcategories';
  conexion.query(query, (error, results) => {
    if (error) {
      console.error('Error al obtener las categorías de subreddits:', error);
      res.status(500).send('Error al obtener las categorías de subreddits');
    } else {
      res.json(results);
    }
  });
});

router.get('/:id', (req, res) => {
  const query = 'SELECT * FROM subredditcategories WHERE id = ?';
  const { id } = req.params;
  conexion.query(query, [id], (error, results) => {
    if (error) {
      console.error('Error al obtener la categoría de subreddit:', error);
      res.status(500).send('Error al obtener la categoría de subreddit');
    } else if (results.length === 0) {
      res.status(404).send('Categoría de subreddit no encontrada');
    } else {
      res.json(results[0]);
    }
  });
});

module.exports = router;

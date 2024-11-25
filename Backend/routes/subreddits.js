const express = require('express');
const router = express.Router();
const conexion = require('../database');

router.get('/', (req, res) => {
  const query = 'SELECT * FROM subreddits';
  conexion.query(query, (error, results) => {
    if (error) {
      console.error('Error al obtener los subreddits:', error);
      res.status(500).send('Error al obtener los subreddits');
    } else {
      res.json(results);
    }
  });
});

router.get('/:id', (req, res) => {
  const query = 'SELECT * FROM subreddits WHERE id = ?';
  const { id } = req.params;
  conexion.query(query, [id], (error, results) => {
    if (error) {
      console.error('Error al obtener el subreddit:', error);
      res.status(500).send('Error al obtener el subreddit');
    } else if (results.length === 0) {
      res.status(404).send('Subreddit no encontrado');
    } else {
      res.json(results[0]);
    }
  });
});

module.exports = router;

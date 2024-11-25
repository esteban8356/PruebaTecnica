const express = require('express');
const router = express.Router();
const conexion = require('../database');

router.get('/', (req, res) => {
  const query = 'SELECT * FROM topics';
  conexion.query(query, (error, results) => {
    if (error) {
      console.error('Error al obtener los temas:', error);
      res.status(500).send('Error al obtener los temas');
    } else {
      res.json(results);
    }
  });
});

router.get('/:id', (req, res) => {
  const query = 'SELECT * FROM topics WHERE id = ?';
  const { id } = req.params;
  conexion.query(query, [id], (error, results) => {
    if (error) {
      console.error('Error al obtener el tema:', error);
      res.status(500).send('Error al obtener el tema');
    } else if (results.length === 0) {
      res.status(404).send('Tema no encontrado');
    } else {
      res.json(results[0]);
    }
  });
});

module.exports = router;

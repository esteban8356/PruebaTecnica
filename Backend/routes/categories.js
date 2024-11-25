const express = require('express');
const router = express.Router();
const conexion = require('../database');

router.get('/', (req, res) => {
  const query = 'SELECT * FROM categories';
  conexion.query(query, (error, results) => {
    if (error) {
      console.error('Error al obtener las categorías:', error);
      res.status(500).send('Error al obtener las categorías');
    } else {
      res.json(results);
    }
  });
});

router.get('/:id', (req, res) => {
  const query = 'SELECT * FROM categories WHERE id = ?';
  const { id } = req.params;
  conexion.query(query, [id], (error, results) => {
    if (error) {
      console.error('Error al obtener la categoría:', error);
      res.status(500).send('Error al obtener la categoría');
    } else if (results.length === 0) {
      res.status(404).send('Categoría no encontrada');
    } else {
      res.json(results[0]);
    }
  });
});

module.exports = router;

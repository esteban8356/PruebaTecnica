const axios = require('axios');
const conexion = require('../database');

async function fetchAndStoreData() {
  try {
    const response = await axios.get('https://www.reddit.com/reddits.json');
    const data = response.data.data.children;

    data.forEach(item => {
      const { id, title, display_name, url } = item.data;

      const query = 'INSERT IGNORE INTO topics (id, title, display_name, url) VALUES (?, ?, ?, ?)';
      conexion.query(query, [id, title, display_name, url], error => {
        if (error) {
          console.error(`Error al insertar el tema ${title}:`, error);
        } else {
          console.log(`Tema ${title} insertado correctamente.`);
        }
      });
    });
  } catch (error) {
    console.error('Error al consumir el JSON:', error);
  }
}

module.exports = { fetchAndStoreData };

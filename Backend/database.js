const mysql = require('mysql');

const conexion = mysql.createConnection({
  host: '127.0.0.1',
  database: 'prueba', 
  user: 'root',       
  password: ''        
});

conexion.connect(error => {
  if (error) {
    console.error('Error al conectar a la base de datos:', error);
    throw error;
  }
  console.log('Conexión a la base de datos exitosa');
});

module.exports = conexion;

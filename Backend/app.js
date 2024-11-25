const express = require('express');
const cors = require('cors'); 
const { fetchAndStoreData } = require('./services/redditService');
const topicsRoutes = require('./routes/topics');
const subredditsRoutes = require('./routes/subreddits');
const subredditCategoriesRoutes = require('./routes/subredditcategories');
const categoriesRoutes = require('./routes/categories');

const app = express();
const port = 3000;

app.use(cors());

fetchAndStoreData();

app.use('/api/topics', topicsRoutes);

app.use('/api/subreddits', subredditsRoutes);

app.use('/api/subredditcategories', subredditCategoriesRoutes);

app.use('/api/categories', categoriesRoutes);

app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});

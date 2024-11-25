$(document).ready(function () {
  const categoriesApi = 'http://localhost:3000/api/categories';
  const subredditsApi = 'http://localhost:3000/api/subreddits';
  const subredditCategoriesApi = 'http://localhost:3000/api/subredditcategories';
  const topicsApi = 'http://localhost:3000/api/topics';

  const categoriesDropdown = $('#categories-dropdown');
  const content = $('#content');

  // Función para cargar categorías en el menú desplegable
  function loadCategories() {
    $.get(categoriesApi, function (categories) {
      categoriesDropdown.empty();
      categories.forEach(category => {
        categoriesDropdown.append(
          `<li><a class="dropdown-item" href="#" data-id="${category.id}">${category.name}</a></li>`
        );
      });
    }).fail(() => {
      alert('Error al cargar las categorías.');
    });
  }

  // Función para cargar subreddits por categoría
  function loadSubredditsByCategory(categoryId) {
    $.get(subredditCategoriesApi, function (relations) {
      $.get(subredditsApi, function (subreddits) {
        const relatedSubreddits = relations
          .filter(rel => rel.category_id == categoryId)
          .map(rel => rel.subreddit_id);

        const filteredSubreddits = subreddits.filter(sub => relatedSubreddits.includes(sub.id));

        content.empty();
        if (filteredSubreddits.length > 0) {
          content.append(`<h3>Subreddits de la categoría seleccionada:</h3>`);
          filteredSubreddits.forEach(subreddit => {
            content.append(`
              <div class="card mt-3">
                <div class="card-body">
                  <h5 class="card-title">${subreddit.title}</h5>
                  <p class="card-text">${subreddit.description}</p>
                  <button class="btn btn-primary view-topics" data-id="${subreddit.id}">Ver Noticias</button>
                </div>
              </div>
            `);
          });
        } else {
          content.append('<p>No hay subreddits disponibles para esta categoría.</p>');
        }
      }).fail(() => {
        alert('Error al cargar los subreddits.');
      });
    }).fail(() => {
      alert('Error al cargar las relaciones subreddit-categoría.');
    });
  }

  // Función para cargar noticias por subreddit
  function loadTopicsBySubreddit(subredditId) {
    $.get(topicsApi, function (topics) {
      const filteredTopics = topics.filter(topic => topic.subreddit_id == subredditId);

      content.empty();
      if (filteredTopics.length > 0) {
        content.append(`<h3>Noticias:</h3>`);
        filteredTopics.forEach(topic => {
          content.append(`
            <div class="card mt-3">
              <div class="card-body">
                <h5 class="card-title">${topic.title}</h5>
                <p class="card-text">${topic.display_name}</p>
                <a href="${topic.url}" target="_blank" class="btn btn-primary">Leer más</a>
              </div>
            </div>
          `);
        });
      } else {
        content.append('<p>No hay noticias disponibles para este subreddit.</p>');
      }
    }).fail(() => {
      alert('Error al cargar las noticias.');
    });
  }

  // Evento al seleccionar una categoría
  categoriesDropdown.on('click', 'a', function (e) {
    e.preventDefault();
    const categoryId = $(this).data('id');
    loadSubredditsByCategory(categoryId);
  });

  // Evento al hacer clic en "Ver Noticias"
  content.on('click', '.view-topics', function () {
    const subredditId = $(this).data('id');
    loadTopicsBySubreddit(subredditId);
  });

  // Cargar categorías al inicio
  loadCategories();
});

# 90s Style Rails Blog with Email Collection

A minimalist Rails blog application with a nostalgic 90s web design aesthetic. Features email collection for newsletters and updates, built with PostgreSQL.

## 🎨 Design Philosophy

This blog embraces the raw, authentic feel of early web design:
- Basic HTML structure with minimal CSS
- Retro color schemes and typography
- Simple, functional layouts
- No JavaScript frameworks (vanilla only)
- Responsive design with a 90s twist

## 🚀 Features

- **Blog Posts**: Create, edit, and display blog posts
- **Email Collection**: Visitor email signup for newsletters
- **PostgreSQL Database**: Robust data storage
- **90s Aesthetic**: Retro web design with modern functionality
- **Docker Support**: Easy deployment and development

## 🛠 Tech Stack

- **Ruby on Rails 7.1+**
- **PostgreSQL 14+**
- **Ruby 3.2+**
- **Docker & Docker Compose**
- **Vanilla HTML/CSS/JavaScript**

## 📋 Prerequisites

- Docker and Docker Compose installed
- Git for version control
- Text editor of your choice

## 🏗 Quick Start

### Using Docker (Recommended)

1. **Clone and Setup**
   ```bash
   git clone <your-repo-url>
   cd blog_app
   ```

2. **Build and Start**
   ```bash
   docker compose up --build
   ```

3. **Setup Database**
   ```bash
   docker compose exec web rails db:create db:migrate db:seed
   ```

4. **Access the Application**
   - Blog: http://localhost:3000
   - Admin: http://localhost:3000/admin

### Manual Setup

1. **Install Dependencies**
   ```bash
   bundle install
   ```

2. **Database Setup**
   ```bash
   rails db:create db:migrate db:seed
   ```

3. **Start Server**
   ```bash
   rails server
   ```

## 📁 Project Structure

```
blog_app/
├── app/
│   ├── controllers/
│   │   ├── posts_controller.rb
│   │   ├── subscribers_controller.rb
│   │   └── pages_controller.rb
│   ├── models/
│   │   ├── post.rb
│   │   └── subscriber.rb
│   ├── views/
│   │   ├── layouts/
│   │   ├── posts/
│   │   ├── subscribers/
│   │   └── pages/
│   └── assets/
│       ├── stylesheets/
│       └── javascripts/
├── db/
│   ├── migrate/
│   └── seeds.rb
├── config/
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## 🗄 Database Schema

### Posts Table
- `id` (Primary Key)
- `title` (String)
- `content` (Text)
- `slug` (String, unique)
- `published_at` (DateTime)
- `created_at` (DateTime)
- `updated_at` (DateTime)

### Subscribers Table
- `id` (Primary Key)
- `email` (String, unique)
- `confirmed` (Boolean, default: false)
- `confirmation_token` (String)
- `created_at` (DateTime)
- `updated_at` (DateTime)

## 🎨 90s Design Elements

### Color Palette
- **Primary**: #000080 (Navy Blue)
- **Secondary**: #FF0000 (Red)
- **Background**: #FFFFFF (White)
- **Text**: #000000 (Black)
- **Accent**: #00FF00 (Lime Green)

### Typography
- **Headers**: Arial, Helvetica, sans-serif
- **Body**: "Courier New", monospace
- **Links**: Underlined with hover effects

### Layout Features
- Centered content with max-width
- Simple navigation menu
- Retro button styles
- Basic form styling
- Responsive grid system

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:

```env
DATABASE_URL=postgresql://postgres:password@db:5432/blog_app
RAILS_ENV=development
SECRET_KEY_BASE=your-secret-key-here
```

### Database Configuration
The application uses PostgreSQL with the following default settings:
- Host: `db` (Docker) or `localhost`
- Port: `5432`
- Database: `blog_app`
- Username: `postgres`
- Password: `password`

## 📝 API Endpoints

### Posts
- `GET /posts` - List all published posts
- `GET /posts/:slug` - Show specific post
- `GET /admin/posts` - Admin post management
- `POST /admin/posts` - Create new post
- `PUT /admin/posts/:id` - Update post
- `DELETE /admin/posts/:id` - Delete post

### Subscribers
- `POST /subscribers` - Subscribe to newsletter
- `GET /subscribers/confirm/:token` - Confirm subscription
- `DELETE /subscribers/:id` - Unsubscribe

## 🚀 Deployment

### Production with Docker
```bash
docker compose -f docker-compose.prod.yml up --build
```

### Heroku Deployment
```bash
heroku create your-blog-app
heroku addons:create heroku-postgresql
git push heroku main
heroku run rails db:migrate
```

## 🧪 Testing

```bash
# Run all tests
docker compose exec web rails test

# Run specific test file
docker compose exec web rails test test/models/post_test.rb
```

## 📧 Newsletter Features

- Email collection with confirmation
- Admin interface for managing subscribers
- Export subscriber list
- Newsletter sending capabilities (future feature)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Troubleshooting

### Common Issues

**Database Connection Error**
```bash
docker compose exec web rails db:create
```

**Port Already in Use**
```bash
# Change port in docker-compose.yml
ports:
  - "3001:3000"
```

**Permission Denied**
```bash
sudo chown -R $USER:$USER .
```

## 📞 Support

For issues and questions:
- Create an issue in the repository
- Check the troubleshooting section
- Review Rails documentation

---

Built with ❤️ and nostalgia for the early web days.

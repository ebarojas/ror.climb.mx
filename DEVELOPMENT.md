# Development Guide

## 🛠 Local Development Setup

### Prerequisites
- Docker and Docker Compose
- Git
- Text editor (VS Code, Sublime Text, etc.)

### Quick Start
1. Clone the repository
2. Run the setup script:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

### Manual Setup
If you prefer to set up manually:

1. **Create Rails Application**
   ```bash
   docker run --rm -v $(pwd):/app -w /app ruby:3.2.2-alpine sh -c "
       apk add --no-cache build-base postgresql-dev git bash &&
       gem install rails &&
       rails new . --database=postgresql --skip-test --skip-bundle --force
   "
   ```

2. **Configure Environment**
   ```bash
   cp env.example .env
   # Edit .env with your settings
   ```

3. **Build and Start**
   ```bash
   docker compose build
   docker compose up -d
   ```

4. **Setup Database**
   ```bash
   docker compose exec web rails db:create db:migrate db:seed
   ```

## 📁 Application Structure

### Models
- `Post`: Blog posts with title, content, slug, and publication date
- `Subscriber`: Email subscribers for newsletters

### Controllers
- `PostsController`: Handle blog post display
- `SubscribersController`: Handle email subscriptions
- `PagesController`: Handle static pages (home, about, etc.)
- `Admin::PostsController`: Admin interface for post management

### Views
- `layouts/application.html.erb`: Main layout with 90s styling
- `posts/`: Blog post views
- `subscribers/`: Subscription forms
- `pages/`: Static page views
- `admin/`: Admin interface views

### Assets
- `stylesheets/application.css`: Main stylesheet with 90s design
- `javascripts/application.js`: Minimal JavaScript functionality

## 🎨 90s Design Implementation

### CSS Structure
```css
/* Base styles */
body {
    font-family: "Courier New", monospace;
    background: #FFFFFF;
    color: #000000;
    margin: 0;
    padding: 20px;
}

/* Navigation */
.nav {
    background: #000080;
    color: #FFFFFF;
    padding: 10px;
    text-align: center;
}

/* Content area */
.container {
    max-width: 800px;
    margin: 0 auto;
    background: #FFFFFF;
    border: 2px solid #000080;
    padding: 20px;
}

/* Buttons */
.btn {
    background: #000080;
    color: #FFFFFF;
    border: 2px outset #000080;
    padding: 8px 16px;
    text-decoration: none;
    font-weight: bold;
}

.btn:hover {
    background: #0000FF;
    border-style: inset;
}
```

### Design Elements to Implement
1. **Color Scheme**: Navy blue (#000080), red (#FF0000), lime green (#00FF00)
2. **Typography**: Courier New for body text, Arial for headers
3. **Layout**: Centered content with borders
4. **Buttons**: 3D effect with outset/inset borders
5. **Links**: Underlined with hover effects
6. **Forms**: Simple styling with borders

## 🔧 Database Schema

### Posts Migration
```ruby
class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.string :slug, null: false, unique: true
      t.datetime :published_at
      t.timestamps
    end
    
    add_index :posts, :slug, unique: true
    add_index :posts, :published_at
  end
end
```

### Subscribers Migration
```ruby
class CreateSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false, unique: true
      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.timestamps
    end
    
    add_index :subscribers, :email, unique: true
    add_index :subscribers, :confirmation_token
  end
end
```

## 🚀 Feature Implementation

### 1. Blog Posts
- [ ] Create Post model with validations
- [ ] Implement PostsController with index/show actions
- [ ] Create views with 90s styling
- [ ] Add slug generation for SEO-friendly URLs
- [ ] Implement admin interface for post management

### 2. Email Collection
- [ ] Create Subscriber model with email validation
- [ ] Implement subscription form with 90s styling
- [ ] Add email confirmation functionality
- [ ] Create admin interface for subscriber management
- [ ] Implement unsubscribe functionality

### 3. Admin Interface
- [ ] Create admin layout with 90s styling
- [ ] Implement post CRUD operations
- [ ] Add subscriber management
- [ ] Create dashboard with statistics

### 4. 90s Design Features
- [ ] Implement retro color scheme
- [ ] Add 3D button effects
- [ ] Create nostalgic typography
- [ ] Add simple animations
- [ ] Implement responsive design with 90s twist

## 🧪 Testing

### Running Tests
```bash
# Run all tests
docker compose exec web rails test

# Run specific test file
docker compose exec web rails test test/models/post_test.rb

# Run with coverage
docker compose exec web COVERAGE=true rails test
```

### Test Structure
```
test/
├── models/
│   ├── post_test.rb
│   └── subscriber_test.rb
├── controllers/
│   ├── posts_controller_test.rb
│   └── subscribers_controller_test.rb
└── integration/
    ├── blog_flow_test.rb
    └── subscription_flow_test.rb
```

## 🔍 Debugging

### View Logs
```bash
# View all logs
docker compose logs -f

# View specific service logs
docker compose logs -f web
docker compose logs -f db
```

### Rails Console
```bash
docker compose exec web rails console
```

### Database Console
```bash
docker compose exec db psql -U postgres -d blog_app
```

## 📦 Deployment

### Production Build
```bash
# Build production image
docker compose -f docker-compose.prod.yml build

# Deploy to production
docker compose -f docker-compose.prod.yml up -d
```

### Environment Variables
Set these in production:
- `RAILS_ENV=production`
- `SECRET_KEY_BASE=your-secret-key`
- `DATABASE_URL=your-production-db-url`
- `POSTGRES_PASSWORD=your-secure-password`

## 🎯 Best Practices

### Code Style
- Follow Ruby style guide
- Use meaningful variable names
- Add comments for complex logic
- Keep methods small and focused

### Security
- Validate all user inputs
- Use strong parameters in controllers
- Implement CSRF protection
- Sanitize HTML content
- Use environment variables for secrets

### Performance
- Add database indexes for frequently queried fields
- Use eager loading to avoid N+1 queries
- Implement caching where appropriate
- Optimize database queries

## 🔄 Workflow

### Daily Development
1. Start services: `docker compose up -d`
2. Make changes to code
3. Test changes: `docker compose exec web rails test`
4. View changes at http://localhost:3000
5. Commit changes with descriptive messages

### Adding New Features
1. Create feature branch: `git checkout -b feature/new-feature`
2. Implement feature with tests
3. Update documentation
4. Create pull request
5. Review and merge

## 📚 Resources

### Rails Documentation
- [Rails Guides](https://guides.rubyonrails.org/)
- [Rails API Documentation](https://api.rubyonrails.org/)

### 90s Web Design
- [Web Design Museum](https://www.webdesignmuseum.org/)
- [90s Web Design Inspiration](https://www.awwwards.com/websites/90s/)

### Docker
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

Happy coding! 🚀 
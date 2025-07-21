# Development Guide

## 🛠 Local Development Setup

### Prerequisites
- Docker and Docker Compose
- Git
- Text editor (VS Code, Sublime Text, etc.)

### Quick Start
1. Clone the repository
2. Start the application:
   ```bash
   docker compose up -d
   ```

3. Install dependencies and setup database:
   ```bash
   docker compose exec web bundle install
   docker compose exec web rails db:migrate
   ```

4. Visit http://localhost:3000

### Manual Setup
If you prefer to set up manually:

1. **Build and Start**
   ```bash
   docker compose build
   docker compose up -d
   ```

2. **Setup Database**
   ```bash
   docker compose exec web rails db:migrate
   ```

## 📁 Application Structure

### Models
- `Post`: File-based blog posts using Jekyll-compatible markdown files
- `Subscriber`: Email subscribers with name, email, about, and verification status

### Controllers
- `PostsController`: Handle blog post display from markdown files
- `SubscribersController`: Handle email subscriptions
- `PagesController`: Handle static pages (home, about, contact)

### Views
- `layouts/application.html.erb`: Main layout with minimal styling
- `posts/`: Blog post views with markdown rendering
- `subscribers/`: Subscription forms
- `pages/`: Static page views (home, about, contact)

### Assets
- `stylesheets/application.css`: Main stylesheet with minimal design
- `public/imgs/`: Static images for blog posts

## 🎨 Minimal Design Implementation

### CSS Structure
```css
/* Base styles */
body {
    font-family: "Courier New", monospace;
    background: #FFFFFF;
    color: #666666;
    margin: 0;
    padding: 40px 20px;
    line-height: 1.6;
    font-size: 14px;
}

/* Navigation */
.nav {
    text-align: center;
    margin: 30px 0;
}

.nav a {
    color: #666666;
    text-decoration: none;
    margin: 0 15px;
    font-size: 12px;
}

/* Content area */
.container {
    max-width: 800px;
    margin: 0 auto;
}

/* Forms */
input, textarea {
    font-family: "Courier New", monospace;
    border: 1px solid #CCCCCC;
    padding: 10px;
}
```

### Design Elements
1. **Color Scheme**: Minimal grays (#666666, #CCCCCC, #FFFFFF)
2. **Typography**: Courier New monospace throughout
3. **Layout**: Centered content with clean spacing
4. **Forms**: Simple styling with minimal borders
5. **Links**: Clean with subtle hover effects

## 🔧 Database Schema

### Posts (File-based)
Posts are stored as Jekyll-compatible markdown files in `app/posts/`:
```markdown
---
layout: post
title: "Post Title"
date: 2024-01-15
author: "Everardo"
categories: [rails, climbing]
tags: [ruby, web-development]
excerpt: "Post excerpt"
---

# Post Content

Markdown content here...
```

### Subscribers Migration
```ruby
class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.string :name, null: false, limit: 100
      t.text :about, limit: 280
      t.boolean :verified, null: false, default: false
      t.timestamps
    end
    
    add_index :subscribers, :email
  end
end
```

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

### Heroku Deployment
```bash
# Create Heroku app
heroku create your-app-name

# Add PostgreSQL
heroku addons:create heroku-postgresql

# Set buildpack
heroku buildpacks:set heroku/ruby

# Deploy
git push heroku main

# Run migrations
heroku run rails db:migrate
```

### Environment Variables
Heroku automatically sets:
- `RAILS_ENV=production`
- `DATABASE_URL` (from PostgreSQL addon)
- `RAILS_LOG_TO_STDOUT=true`

### Manual Setup (if needed)
```bash
# Add Ruby version to Gemfile
ruby "3.2.2"

# Add platform for Heroku
docker compose exec web bundle lock --add-platform x86_64-linux
```

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
3. View changes at http://localhost:3000
4. Commit changes with descriptive messages

### Adding New Blog Posts
1. Create markdown file in `app/posts/` with format: `YYYY-MM-DD-title.md`
2. Add Jekyll front matter with title, date, author, etc.
3. Write content in markdown
4. Add images to `public/imgs/` and reference as `/imgs/filename.jpg`

### Adding New Features
1. Create feature branch: `git checkout -b feature/new-feature`
2. Implement feature
3. Update documentation
4. Create pull request
5. Review and merge

## 📚 Resources

### Rails Documentation
- [Rails Guides](https://guides.rubyonrails.org/)
- [Rails API Documentation](https://api.rubyonrails.org/)

### Markdown & Jekyll
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Markdown Guide](https://www.markdownguide.org/)

### Heroku
- [Heroku Rails Documentation](https://devcenter.heroku.com/categories/ruby-support)
- [Heroku PostgreSQL](https://devcenter.heroku.com/articles/heroku-postgresql)

### Docker
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

Happy coding! 🚀 
                                                                                      
```                                                                             
            ,--,                      ____                           ____              
          ,--.'|     ,--,           ,'  , `.  ,---,                ,'  , `.            
          |  | :   ,--.'|        ,-+-,.' _ |,---.'|             ,-+-,.' _ |            
          :  : '   |  |,      ,-+-. ;   , |||   | :          ,-+-. ;   , ||,--,  ,--,  
   ,---.  |  ' |   `--'_     ,--.'|'   |  ||:   : :         ,--.'|'   |  |||'. \/ .`|  
  /     \ '  | |   ,' ,'|   |   |  ,', |  |,:     |,-.     |   |  ,', |  |,'  \/  / ;  
 /    / ' |  | :   '  | |   |   | /  | |--' |   : '  |     |   | /  | |--'  \  \.' /   
.    ' /  '  : |__ |  | :   |   : |  | ,    |   |  / :     |   : |  | ,      \  ;  ;   
'   ; :__ |  | '.'|'  : |__ |   : |  |/     '   : |: |     |   : |  |/      / \  \  \  
'   | '.'|;  :    ;|  | '.'||   | |`-'      |   | '/ :___  |   | |`-'     ./__;   ;  \ 
|   :    :|  ,   / ;  :    ;|   ;/          |   :    /  .\ |   ;/         |   :/\  \ ; 
 \   \  /  ---`-'  |  ,   / '---'           /    \  /\  ; |'---'          `---'  `--`  
  `----'            ---`-'                  `-'----'  `--"                             
```                                    

# climb.mx blog and simple personal website

A minimalist Rails blog application with a minimal web design aesthetic.

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
- **Jekyll style blogposts**: Blog posts are md files, totally cross compatible with Jekyll

## 🛠 Tech Stack

- **Ruby on Rails**
- **PostgreSQL+**
- **Ruby 3.2**
- **Docker & Docker Compose**
- **Vanilla HTML/CSS/JavaScript**

## 🏗 Quick Start

### Using Docker (Recommended)

1. **Build and Start**
   ```bash
   docker compose up --build
   ```

2. **Setup Database**
   ```bash
   docker compose exec web rails db:create db:migrate db:seed
   ```

3. **Access the Application**
   - Blog: http://localhost:3000
   - Admin: http://localhost:3000/admin


## 📁 Project Structure

```
ror.climb.mx/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── pages_controller.rb
│   │   ├── posts_controller.rb
│   │   └── subscribers_controller.rb
│   ├── models/
│   │   ├── application_record.rb
│   │   ├── post.rb
│   │   └── subscriber.rb
│   ├── views/
│   │   ├── layouts/
│   │   │   ├── application.html.erb
│   │   │   ├── mailer.html.erb
│   │   │   └── mailer.text.erb
│   │   ├── pages/
│   │   │   ├── about.html.erb
│   │   │   ├── contact.html.erb
│   │   │   └── home.html.erb
│   │   ├── posts/
│   │   │   ├── index.html.erb
│   │   │   └── show.html.erb
│   │   ├── subscribers/
│   │   │   └── new.html.erb
│   │   └── pwa/
│   │       ├── manifest.json.erb
│   │       └── service-worker.js
│   ├── assets/
│   │   ├── images/
│   │   └── stylesheets/
│   │       └── application.css
│   ├── posts/                    # Markdown blog posts (Jekyll-style)
│   │   ├── 2025-01-31-Books-I-read-in-2024.md
│   │   ├── 2024-04-08-Climbing-Rope-Mat.md
│   │   └── ... (other .md files)
│   ├── drafts/                   # Draft posts
│   ├── helpers/
│   ├── jobs/
│   └── mailers/
├── config/
│   ├── application.rb
│   ├── routes.rb
│   ├── database.yml
│   ├── environments/
│   ├── initializers/
│   └── locales/
├── db/
│   ├── migrate/
│   ├── schema.rb
│   └── seeds.rb
├── public/
│   ├── imgs/                     # Blog post images
│   ├── robots.txt
│   ├── sitemap.xml
│   ├── ai.txt
│   ├── 404.html
│   └── favicon files
├── .github/
│   └── workflows/
│       └── ci.yml
├── bin/                          # Rails binstubs
├── lib/
├── log/
├── storage/
├── tmp/
├── vendor/
├── Dockerfile
├── docker-compose.yml
├── docker-compose.prod.yml
├── Gemfile
├── README.md
└── DEVELOPMENT.md
```

## 🗄 Database Schema

### Subscribers Table
- `id` (Primary Key)
- `email` (String, unique)
- `name` (Boolean, default: false)
- `about` (Text)
- `created_at` (DateTime)
- `updated_at` (DateTime)

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


## 📧 Newsletter Features (coming at some point)

- Email collection with confirmation
- Admin interface for managing subscribers
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

Built with ❤️ from the geocities and net art days.

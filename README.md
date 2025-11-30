                                                                                      
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

# climb.mx blog a simple personal website

A minimalist Rails blog application with a minimal web design aesthetic, designed to get you writing 
and collecting emails from your readers so you can push your updates to them via email or similar.

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
- **SEO Optimized**: Meta tags, Open Graph, structured data, and dynamic sitemap
- **LLM Attribution**: JSON-LD structured data and ai.txt for proper AI crawler attribution

## 🔍 SEO & LLM Attribution

This blog includes comprehensive SEO features and LLM attribution support to improve search engine visibility and ensure proper content attribution by AI systems.

### SEO Features

**Meta Descriptions**
- Automatically generated from post frontmatter `description` field
- Falls back to truncated content (160 chars) if description is missing
- Used by search engines for search result snippets
- Helper method: `meta_description(@post)` provides consistent fallback logic

**Open Graph Tags**
- Enables rich previews when sharing links on social media (Facebook, Twitter, LinkedIn, etc.)
- Includes: title, description, URL, and content type
- Automatically generated for all pages

**HTML Lang Attribute**
- Set to `lang="en"` on all pages for accessibility and SEO
- Helps search engines understand the primary language

**Dynamic Sitemap**
- Automatically generated XML sitemap at `/sitemap.xml`
- Includes all blog posts with last modification dates
- Follows sitemap.org protocol
- New posts are automatically included without manual updates
- Referenced in `robots.txt` for search engine discovery

**Canonical URLs**
- Prevents duplicate content issues
- Specifies the "official" URL for each page
- Helps search engines understand which URL to index

**robots.txt**
- Configured to allow all search engine crawlers
- Includes sitemap location
- Disallows admin and draft areas

### LLM Attribution

**JSON-LD Structured Data**
- Article schema following Schema.org specification
- Includes: headline, author, publication date, and URL
- Helps LLMs (ChatGPT, Claude, Perplexity, etc.) properly attribute content
- Generated via helper method: `article_json_ld(@post)`
- References:
  - [Schema.org Article](https://schema.org/Article)
  - [JSON-LD specification](https://json-ld.org/)

**ai.txt File**
- Located at `/ai.txt`
- Provides structured information for AI crawlers
- Includes author name, site URL, and attribution requirements
- Helps ensure proper content attribution by AI systems

### SEO Helper Methods

The `SeoHelper` module (`app/helpers/seo_helper.rb`) provides centralized SEO logic:

- `meta_description(post, default)` - Generates meta descriptions with intelligent fallback
- `base_url` - Returns canonical domain (production) or current URL (development)
- `canonical_url(custom_url)` - Generates canonical URLs
- `og_url(custom_url)` - Generates Open Graph URLs (matches canonical)
- `article_json_ld(post)` - Generates JSON-LD Article schema for blog posts

**Benefits:**
- DRY: Single source of truth for SEO logic
- Consistency: All views use the same logic
- Maintainability: Update SEO logic in one place
- Testability: Helper methods can be unit tested

### SEO Best Practices

**Writing Meta Descriptions**
- Add `description` field to post frontmatter in YAML
- Keep descriptions between 150-160 characters for optimal display
- Write compelling, descriptive summaries that encourage clicks
- If omitted, the system automatically truncates content

**Example:**
```yaml
---
title: "My Amazing Post"
date: 2025-01-15
description: "A compelling 150-character description that summarizes the post"
---
```

**Testing SEO Tags**
- Use browser developer tools to inspect meta tags
- Test Open Graph tags with [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
- Validate JSON-LD with [Google Rich Results Test](https://search.google.com/test/rich-results)
- Check sitemap at `/sitemap.xml`

**References:**
- [Google Search Console](https://search.google.com/search-console)
- [Open Graph Protocol](https://ogp.me/)
- [Schema.org Documentation](https://schema.org/)

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

## ✍️ Creating New Posts

This blog uses Jekyll-style markdown files for posts. Use the included script to quickly create new posts:

### First Time Setup
Make the script executable:
```bash
chmod +x bin/new-post
```

### Usage

**Basic Post Creation:**
```bash
./bin/new-post "Your Post Title Here"
```

**Post with Images:**
```bash
./bin/new-post "Your Post Title Here" -i folder_name
```

**Examples:**
```bash
# Basic post
./bin/new-post "My Amazing Rails Tutorial"

# Post with images from a folder
./bin/new-post "My Photo Gallery" -i vacation_photos
```

This creates: `app/posts/2025-01-27-my-amazing-rails-tutorial.md`

### What the Script Does
- Generates filename with current date and title (spaces → dashes)
- Creates proper Jekyll front matter with:
  - `title`: Exact title you provided
  - `date`: Current date and time
  - `permalink`: Title converted to snake_case
  - `categories`: "general" (placeholder)
  - `description`: "placeholder" (placeholder) - **Important for SEO!**
- Places the file in `app/posts/` directory

**SEO Note:** The `description` field is used for SEO meta descriptions. Replace "placeholder" with a compelling 150-160 character description that summarizes your post. If omitted, the system will automatically truncate your content, but a well-written description performs better in search results. See the [SEO & LLM Attribution](#-seo--llm-attribution) section for more details.

### Image Integration Feature (`-i` flag)

When using the `-i` flag, the script automatically includes all images from the specified folder:

**Requirements:**
- Folder must exist in `/public/imgs/`
- Only image files are processed (jpg, jpeg, png, gif, webp)
- Images are sorted alphabetically

**What happens:**
1. Script validates the folder exists in `/public/imgs/`
2. Scans for image files and ignores non-image files
3. Generates markdown image tags with captions:
   ```markdown
   ![filename](/imgs/folder/filename.jpg)
   *filename*
   ```
4. Adds an "Images" section to the post content

**Error handling:**
- If folder doesn't exist: "Folder not found, aborting"
- Script fails gracefully without creating the post

### Manual Fallback
If the script isn't working, you can create posts manually:
```bash
# Create the file
touch app/posts/$(date +%Y-%m-%d)-your-title-here.md

# Add front matter manually
cat > app/posts/$(date +%Y-%m-%d)-your-title-here.md << 'EOF'
---
layout: post
title:  "Your Title Here"
date:   $(date +"%Y-%m-%d %H:%M:%S +0000")
categories: general
description: placeholder
permalink: /your_title_here/
---

# Your Title Here

Your content goes here...
EOF
```

## 📁 Project Structure

```
ror.climb.mx/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── pages_controller.rb
│   │   ├── posts_controller.rb
│   │   ├── sitemap_controller.rb
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
│   │   ├── sitemap/
│   │   │   └── index.xml.erb        # Dynamic sitemap (not in public/)
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
│   │   └── seo_helper.rb         # SEO helper methods
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
│   ├── robots.txt                # Search engine crawler instructions
│   ├── ai.txt                    # AI crawler attribution information
│   ├── 404.html
│   └── favicon files
│   # Note: sitemap.xml is dynamically generated at /sitemap.xml (not a static file)
├── resources/                    # Project resources and documentation
│   ├── Cursor_instructions.md    # Technical documentation for Ulysses project
│   ├── Ulysses_Dialog_Compendium.md  # Extracted dialogue reference
│   └── ulysses.txt              # Source text (Project Gutenberg)
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

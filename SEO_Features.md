# SEO & LLM Attribution

This blog includes comprehensive SEO features and LLM attribution support to improve search engine visibility and ensure proper content attribution by AI systems.

## SEO Features

### Meta Descriptions
- Automatically generated from post frontmatter `description` field
- Falls back to truncated content (160 chars) if description is missing
- Used by search engines for search result snippets
- Helper method: `meta_description(@post)` provides consistent fallback logic

### Open Graph Tags
- Enables rich previews when sharing links on social media (Facebook, Twitter, LinkedIn, etc.)
- Includes: title, description, URL, and content type
- Automatically generated for all pages

### HTML Lang Attribute
- Set to `lang="en"` on all pages for accessibility and SEO
- Helps search engines understand the primary language

### Dynamic Sitemap
- Automatically generated XML sitemap at `/sitemap.xml`
- Includes all blog posts with last modification dates
- Follows sitemap.org protocol
- New posts are automatically included without manual updates
- Referenced in `robots.txt` for search engine discovery

### Canonical URLs
- Prevents duplicate content issues
- Specifies the "official" URL for each page
- Helps search engines understand which URL to index

### robots.txt
- Configured to allow all search engine crawlers
- Includes sitemap location
- Disallows admin and draft areas

## LLM Attribution

### JSON-LD Structured Data
- Article schema following Schema.org specification
- Includes: headline, author, publication date, and URL
- Helps LLMs (ChatGPT, Claude, Perplexity, etc.) properly attribute content
- Generated via helper method: `article_json_ld(@post)`
- References:
  - [Schema.org Article](https://schema.org/Article)
  - [JSON-LD specification](https://json-ld.org/)

### ai.txt File
- Located at `/ai.txt`
- Provides structured information for AI crawlers
- Includes author name, site URL, and attribution requirements
- Helps ensure proper content attribution by AI systems

## SEO Helper Methods

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

## SEO Best Practices

### Writing Meta Descriptions
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

### Testing SEO Tags
- Use browser developer tools to inspect meta tags
- Test Open Graph tags with [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
- Validate JSON-LD with [Google Rich Results Test](https://search.google.com/test/rich-results)
- Check sitemap at `/sitemap.xml`

### References
- [Google Search Console](https://search.google.com/search-console)
- [Open Graph Protocol](https://ogp.me/)
- [Schema.org Documentation](https://schema.org/)


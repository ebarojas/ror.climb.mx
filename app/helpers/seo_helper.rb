# SEO helper methods for generating meta tags and structured data
#
# This module provides centralized SEO logic for consistent implementation across all views.
# Benefits:
# - DRY: Eliminates repetition of SEO tag generation logic
# - Consistency: All views use the same logic for meta descriptions, URLs, etc.
# - Maintainability: Changes to SEO logic (domain, description length, etc.) in one place
# - Testability: Helper methods can be unit tested
#
# Usage in views:
#   <%= meta_description(@post) %>
#   <%= base_url %>
#   <%= canonical_url %>
#   <%= article_json_ld(@post) %>
module SeoHelper
  # Generate meta description with intelligent fallback logic
  #
  # For blog posts: Uses description from frontmatter, or falls back to truncated content
  # For other pages: Uses provided default description
  #
  # @param post [Post, nil] The post object (optional)
  # @param default [String, nil] Default description for non-post pages (optional)
  # @return [String] Meta description text (max 160 chars for SEO best practices)
  #
  # Examples:
  #   meta_description(@post) # Uses post.description or truncates content
  #   meta_description(nil, "About page") # Returns "About page"
  #   meta_description() # Returns default "Blog posts by Everardo Barojas"
  def meta_description(post = nil, default = nil)
    return default if default.present?
    return "Blog posts by Everardo Barojas" unless post
    post.description.presence || post.excerpt_or_content.truncate(160)
  end

  # Base URL for the site
  #
  # Returns the canonical domain for production, or current request URL for development.
  # Used in sitemap, canonical URLs, and Open Graph tags.
  #
  # @return [String] Base URL (e.g., "https://wwwww.climb.mx" in production)
  #
  # Note: Domain is "wwwww.climb.mx" (5 w's) as specified
  def base_url
    Rails.env.production? ? "https://wwwww.climb.mx" : request.base_url
  end

  # Generate canonical URL for current page
  #
  # Canonical URLs help prevent duplicate content issues by telling search engines
  # which URL is the "official" version of a page.
  #
  # @param custom_url [String, nil] Optional custom URL to use instead of current request URL
  # @return [String] Canonical URL
  #
  # Example:
  #   canonical_url # => "https://wwwww.climb.mx/posts/my-post"
  #   canonical_url("https://example.com/custom") # => "https://example.com/custom"
  def canonical_url(custom_url = nil)
    custom_url || request.original_url
  end

  # Generate Open Graph URL
  #
  # Open Graph URLs should match canonical URLs for consistency.
  # This method delegates to canonical_url to ensure they're always in sync.
  #
  # @param custom_url [String, nil] Optional custom URL
  # @return [String] Open Graph URL
  def og_url(custom_url = nil)
    canonical_url(custom_url)
  end

  # Generate Open Graph image URL
  #
  # Returns the full URL to the site icon for social media sharing.
  # Uses icon.png as the default Open Graph image for all pages.
  #
  # @return [String] Full URL to the Open Graph image
  #
  # Example:
  #   og_image_url # => "https://wwwww.climb.mx/icon.png"
  def og_image_url
    "#{base_url}/icon.png"
  end

  # Generate JSON-LD Article schema for blog posts
  #
  # Creates structured data following Schema.org Article specification.
  # This helps search engines and LLMs (ChatGPT, Claude, Perplexity, etc.) properly
  # understand and attribute blog post content.
  #
  # @param post [Post] The post object
  # @return [String] JSON-LD script content (marked as html_safe)
  #
  # Schema includes:
  # - @type: "Article" (indicates this is a blog post/article)
  # - headline: Post title
  # - author: Person object with author name
  # - datePublished: Publication date in ISO 8601 format
  # - url: Canonical URL of the post
  #
  # Example output:
  #   {
  #     "@context": "https://schema.org",
  #     "@type": "Article",
  #     "headline": "My Post Title",
  #     "author": { "@type": "Person", "name": "Everardo" },
  #     "datePublished": "2025-01-15T10:00:00Z",
  #     "url": "https://wwwww.climb.mx/posts/my-post"
  #   }
  #
  # References:
  # - Schema.org Article: https://schema.org/Article
  # - JSON-LD specification: https://json-ld.org/
  def article_json_ld(post)
    {
      "@context": "https://schema.org",
      "@type": "Article",
      "headline": post.title,
      "author": {
        "@type": "Person",
        "name": post.author
      },
      "datePublished": post.date.iso8601,
      "url": request.original_url
    }.to_json.html_safe
  end
end

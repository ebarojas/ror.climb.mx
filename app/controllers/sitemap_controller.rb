# Sitemap Controller
#
# Generates dynamic XML sitemap for search engines following the sitemap.org protocol.
# The sitemap helps search engines discover and index all blog posts automatically.
#
# What it includes:
# - Home page URL
# - Posts index page URL
# - All individual blog post URLs with lastmod dates
#
# Access: Available at /sitemap.xml
#
# The sitemap is dynamically generated from all markdown files in app/posts/,
# so new posts are automatically included without manual updates.
#
# References:
# - Sitemap protocol: https://www.sitemaps.org/protocol.html
class SitemapController < ApplicationController
  # Generate XML sitemap
  #
  # Loads all posts and makes them available to the sitemap view.
  # The view generates the XML following sitemap.org protocol.
  def index
    @posts = Post.all
    # Helper methods are automatically available in views, so base_url can be called directly
  end
end


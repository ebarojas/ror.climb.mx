class Post
  include ActiveModel::Model
  
  attr_accessor :title, :date, :author, :categories, :tags, :excerpt, :content, :slug, :filename
  
  def self.markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true
    )
  end
  
  def self.all
    posts_dir = Rails.root.join('app', 'posts')
    return [] unless Dir.exist?(posts_dir)
    
    Dir.glob(File.join(posts_dir, '*.md')).map do |file|
      Post.from_file(file)
    end.sort_by(&:date).reverse
  end
  
  def self.find(slug)
    posts_dir = Rails.root.join('app', 'posts')
    # Find all markdown files and check their slugs
    Dir.glob(File.join(posts_dir, '*.md')).each do |file|
      post = Post.from_file(file)
      return post if post&.slug == slug
    end
    
    nil
  end
  
  def self.from_file(file_path)
    content = File.read(file_path)
    filename = File.basename(file_path, '.md')
    
    # Extract front matter and content
    if content.start_with?('---')
      parts = content.split('---', 3)
      return nil if parts.length < 3
      
      front_matter = YAML.safe_load(parts[1], permitted_classes: [Date, Time])
      markdown_content = parts[2].strip
    else
      front_matter = {}
      markdown_content = content
    end
    
    # Parse date from filename (format: YYYY-MM-DD-title)
    date_match = filename.match(/^(\d{4}-\d{2}-\d{2})-/)
    parsed_date = date_match ? Date.parse(date_match[1]) : Date.today
    
    # Generate slug from filename
    slug = filename.sub(/^\d{4}-\d{2}-\d{2}-/, '').gsub('-', ' ')
    
    Post.new(
      title: front_matter['title'] || slug.titleize,
      date: front_matter['date'] || parsed_date,
      author: front_matter['author'] || 'Everardo',
      categories: Array(front_matter['categories'] || []),
      tags: Array(front_matter['tags'] || []),
      excerpt: front_matter['excerpt'] || '',
      content: markdown_content,
      slug: slug.parameterize,
      filename: filename
    )
  end
  
  def to_param
    slug
  end
  
  def formatted_date
    date_obj = date.is_a?(String) ? Date.parse(date) : date.to_date
    date_obj.strftime('%B %d, %Y')
  end
  
  def excerpt_or_content
    excerpt.present? ? excerpt : content.truncate(200)
  end
  
  def rendered_content
    Post.markdown_renderer.render(content)
  end
end
 
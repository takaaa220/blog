# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://takaaa220.com"

SitemapGenerator::Sitemap.create do
  add root_path, lastmod: Post.published.desc.first.updated_at

  Post.published.each do |post|
    add post_path(post.pid), lastmod: post.updated_at
  end
end

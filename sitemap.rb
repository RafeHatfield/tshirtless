require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://tshirtless.me'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 1.0
  add '/contact', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
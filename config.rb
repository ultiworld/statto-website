page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :haml, { format: :html5, attr_wrapper: '"' }

set :markdown_engine, :kramdown
set :markdown, { smartypants: true, fenced_code_blocks: true }
module Haml::Filters::Kramdown
  include Haml::Filters::Base

  def render(text)
    Kramdown::Document.new(text).to_html
  end
end

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

require 'extensions/retina_images'
activate :retina_images, input_folders: ['assets/images']

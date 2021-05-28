# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'contentful_middleman'
ignore 'templates/*.html'

activate :dotenv

activate :contentful do |f|
  f.space         = { site: ENV['CONTENTFUL_SPACE_ID'] }
  f.access_token  = ENV['CONTENTFUL_DELIVERY_TOKEN']
  f.content_types = {pages: "page", navs: "navigation"}
end

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
if @app.data.try(:site).try(:pages)
  # Loop through each page
  data.site.pages.each do |_id, page|
    # The path to the page gets set from the slug of the page
    if page.title == "Home"
      path = "/index.html"
    else
      path = "#{page.slug}"
    end
    # Use the appropriate template
    template = "templates/page.html"
    # Add the proxy
    proxy path, template, locals: { page: page }, :layout => "layout"
  end
end


# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
with_layout :layout do
  page "conference"
  page "registration"
  page "sponsors"
  page "guide"
end
# page "index.html", :layout => "layout"
# page "guide.html", :layout => "layout"
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def amp
    '<span class="amp">&#038;</span>'
  end

  def place_img(size)
    '<img src=' + lorem.image(size) + ">"
  end

  def support_mailto
    "mailto:talkabit.team@gmail.com?subject=Talk+a+Bit+Sponsorship"
  end

  def food_and_beverages_mailto
    "mailto:talkabit.team@gmail.com?subject=Talk+a+Bit+Food+and+Beverages+Support"
  end

  def eventbrite_registration
    %{
      <div style="width:100%; text-align:left;" >
        <iframe  src="http://talkabit.eventbrite.com?ref=eweb" frameborder="0" height="1000" width="100%" vspace="0" hspace="0" marginheight="5" marginwidth="5" scrolling="auto" allowtransparency="true">
        </iframe>

        <div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:100%; text-align:left;" >
          <a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/eweb">Event Registration Online</a>
          <span style="color:#ddd;"> for </span>
          <a style="color:#ddd; text-decoration:none;" target="_blank" href="http://http://talkabit.eventbrite.com?ref=eweb">Talk a Bit</a>
          <span style="color:#ddd;">powered by</span>
          <a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=eweb">Eventbrite</a>
        </div>
      </div>
    }
  end
end

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
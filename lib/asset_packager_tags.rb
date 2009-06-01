require 'synthesis/asset_package_helper'
include Synthesis::AssetPackageHelper
include ActionView::Helpers::TagHelper
include ActionView::Helpers::AssetTagHelper

module AssetPackagerTags
  include Radiant::Taggable
  
  desc %{
    Include stylesheets from the public/stylesheets directory.
    
    When running in development environment, this will include 
    each file individually. In the production environment, the 
    individual files will be merged and minified into a single
    file.
  }
  tag 'stylesheet_link_merged' do |tag|
    # tag.locals.filter_attributes = tag.attr || {}
    stylesheet_link_merged :base
  end
  
  desc %{
    Include javascripts from the public/javascripts directory.
    
    When running in development environment, this will include 
    each file individually. In the production environment, the 
    individual files will be merged and minified into a single
    file.
  }
  tag 'javascript_include_merged' do |tag|
    # tag.locals.filter_attributes = tag.attr || {}
    javascript_include_merged :base
  end
  
end
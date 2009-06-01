require 'synthesis/asset_package_helper'

module AssetPackagerTags
  include Radiant::Taggable
  include Synthesis::AssetPackageHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  
  desc %{
    Include packaged stylesheets from the public/stylesheets 
    directory. Indicate which package you want to load with
    the @sources@ attribute. Packages are defined in 
    config/asset_packages.yml. Additionally, you can set the
    @media@ attribute for each linked stylesheet. The defualt
    is "screen".
    
    *Usage:*
    <pre><code><r:stylesheet_link_merged sources="base" [media="screen|print"] /></code></pre>
    
    When running in development environment, this will include 
    each file individually. In the production environment, the 
    individual files will be merged and minified into a single
    file.
  }
  tag 'stylesheet_link_merged' do |tag|
    options         = {}
    attributes      = tag.attr || {}
    options[:media] = attributes["media"]
    sources         = attributes["sources"] || "base"
    stylesheet_link_merged( sources, options )
  end
  
  desc %{
    Include packaged javascripts from the public/javascripts 
    directory. Indicate which package you want to load with
    the @sources@ attribute. Packages are defined in 
    config/asset_packages.yml.

    *Usage:*
    <pre><code><r:javascript_include_merged sources="base" /></code></pre>
    
    When running in development environment, this will include 
    each file individually. In the production environment, the 
    individual files will be merged and minified into a single
    file.
  }
  tag 'javascript_include_merged' do |tag|
    attributes = tag.attr || {}
    sources    = attributes["sources"] || "base"
    javascript_include_merged( sources )
  end
  
  desc %{
    Include javascripts from the public/javascripts directory
    Returns an html script tag for each file named in the 
    @sources@ attribute. You can pass multiple filenames, 
    separating them with commas. 

    *Usage:*
    <pre><code><r:javascript_include_tag sources="prototype, 
    scriptaculous, application" /></code></pre>
  }
  tag 'javascript_include_tag' do |tag|
    options =  {}
    attributes = tag.attr || {}
    options[:recursive] = (attributes["recursive"] == "true") ? true : nil
    options[:cache]     = (attributes["cache"] == "true") ? true : nil
    
    sources = (attributes["sources"] == "all" ?
      sources = :all :
      sources = (attributes["sources"] || "").split(",").map{ |s| s.strip })
    
    javascript_include_tag( sources, options )
  end
  
end
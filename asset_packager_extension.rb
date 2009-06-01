class AssetPackagerExtension < Radiant::Extension
  version "0.1"
  description "An asset packager for Radiant, allowing you to server minified css and js files from your public directory."
  url "http://wiki.github.com/nelstrom/radiant-asset_packager-extension"
  
  def activate
    Page.send :include, AssetPackagerTags
  end
  
end

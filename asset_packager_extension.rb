# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class AssetPackagerExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/asset_packager"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :asset_packager
  #   end
  # end
  
  def activate
    # admin.tabs.add "Asset Packager", "/admin/asset_packager", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Asset Packager"
  end
  
end

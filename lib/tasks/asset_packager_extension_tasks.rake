namespace :radiant do
  namespace :extensions do
    namespace :asset_packager do
      
      desc "Runs the migration of the Asset Packager extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          AssetPackagerExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          AssetPackagerExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Asset Packager to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from AssetPackagerExtension"
        copy_dirs = ["/public/**/*", "/config/**/*"]
        copy_dirs.each do |dir|
          Dir[AssetPackagerExtension.root + dir].reject(&is_svn_or_dir).each do |file|
            path = file.sub(AssetPackagerExtension.root, '')
            directory = File.dirname(path)
            mkdir_p RAILS_ROOT + directory
            cp file, RAILS_ROOT + path
          end
        end
      end  
    end
  end
end

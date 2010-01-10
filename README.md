# Asset Packager

This extension provides the functionality of the Rails [Asset Packager plugin][1] for [Radiant CMS][2]. 


## Installation

This extension is hosted on github. If you have git installed, then `cd` to the root of your radiant project and issue the following commands: 

    git clone git://github.com/nelstrom/radiant-asset_packager-extension.git vendor/extensions/asset_packager

This extension includes the Rails asset packager as a git submodule, so change to the asset_packager directory, and issue the following commands: 

    cd vendor/extensions/asset_packager
    git submodule init
    git submodule update

Change back to the root directory for your Radiant site, and run the **update** rake task for this extension.

    cd ../../..
    rake radiant:extensions:asset_packager:update

There are no migrations, so there is no need to run the `rake radiant:extensions:asset_packager:migrate` task.

## Usage

This extension offers 4 new tags:

* r:javascript_include_tag
* r:javascript_include_merged
* r:stylesheet_link_tag
* r:stylesheet_link_merged

### r:javascript_include_tag

This is simply a wrapper for the Rails helper method [javascript_include_tag][3]. It accepts a comma separated list of `sources`, and generates a `<script src="source" type="text/javascript"/>` tag for each source. If you specify `cache="true"` the sources can be merged into a single `all.js` file. This functionality is enabled when `ActionController::Base.perform_caching` is set to `true`, which is the default in production environment, but not in development environment.

e.g. the following:

    <r:javascript_include_tag sources="jquery-1.3.2.min.js, application" cache="true" />

would generate code:

    // ActionController::Base.perform_caching = false  # e.g. in development environment
    <script src="/javascripts/jquery-1.3.2.min.js?1263122757" type="text/javascript" charset="utf-8"></script>
    <script src="/javascripts/application.js?1263122757" type="text/javascript" charset="utf-8"></script>

    // ActionController::Base.perform_caching = true  # e.g. in production environment
    <script src="/javascripts/all.js?1263122757" type="text/javascript" charset="utf-8"></script>

The `?1263122757` which is appended to the end of the files is created from the file's timestamp.
  
Serving a single javascript file means fewer HTTP requests, which can improve
performance for visitors to your site. 

### r:javascript_include_merged

The [javascript_include_tag][3] bundles the files together, but it does not
minify them. The [asset_packager plugin][1] offers this additional
optimisation. Minification strips out all comments and unnecessary whitespace.
It renders the Javascript practically unreadable to a human, but still
functional. This reduces file size.

If you choose to use the `<r:javascript_include_merged/>` tag, you have to run
a rake task to generate the minified and bundled asset package:

    rake asset:packager:build_all

This extra step could be added to your deployment script with an after hook.

[1]: http://github.com/sbecker/asset_packager/tree/master
[2]: http://radiantcms.org/
[3]: http://apidock.com/rails/ActionView/Helpers/AssetTagHelper/javascript_include_tag
[4]: http://apidock.com/rails/ActionView/Helpers/AssetTagHelper/stylesheet_link_tag

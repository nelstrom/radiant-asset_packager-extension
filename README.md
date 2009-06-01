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

There are no migrations, so you don't need to run the `rake radiant:extensions:asset_packager:migrate` task.

[1]: http://github.com/sbecker/asset_packager/tree/master
[2]: http://radiantcms.org/

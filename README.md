web-minifier
============

Script to enhance Web Performance by combining JS and/or CSS contents into single JS/CSS file and then minify using YUICompressor

Here's how to run the tool:

- Download YUICompressor from the website http://yui.github.io/yuicompressor/ and put to a directory
- Adjust script parameter YUI_DIR to the location of YUICompressor tool
- Adjust script parameters CSS_DIR and JS_DIR to the directory of your CSS and Javascript directories
- Adjust script parameter EXCLUDED_DIR if you want to exclude some directories on your CSS/Javascript dir
- Run the following command:
sh minifier.sh : will work on all css and js directories
sh minifier.sh js : only works on all js directories, except the EXCLUDED_DIR
sh minifier.sh css : only works on all css directories, except the EXCLUDED_DIR
sh minifier.atomic.sh css homepage : only works on homepage css directory
sh minifier.atomic.sh js profile* : works on all js directories preceded with 'profile' string, like profile_pro and profile_expert
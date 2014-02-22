pincent.net
===========

Source of <http://www.pincent.net/>.

Generate website:

    jekyll build

To upload all files:

    cd _site
    find . -type f -exec echo {} \; -exec curl -# --ftp-create-dirs -T {} ftp://user:pass@ip:port/web/{} \; 

To upload the text files only:

    cd _site
    find . -type f \( -name "*.html" -o -name "*.css" -o -name "*.js" -o -name "*.xml" -o -name "*.txt" \) -exec echo {} \; -exec curl -# --ftp-create-dirs -T {} ftp://user:pass@ip:port/web/{} \; 

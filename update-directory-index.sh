#!/bin/bash
RELEASES_PATH=./releases
SNAPSHOTS_PATH=./snapshots
DOC_PATH=./doc
RELEASES_ADDON_PATH=./releases-addon

for DIR in $(find ${RELEASES_PATH} ${SNAPSHOTS_PATH} ${RELEASES_ADDON_PATH} -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done

(
  echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
  ls -1p $DOC_PATH | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
  echo -e "</pre>\n</body>\n</html>"
) > "$DOC_PATH/index.html"


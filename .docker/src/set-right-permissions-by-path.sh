#!/bin/bash

# Run as:
# bash this-script.sh /var/www and again passing your project folder /var/www/project-path

FILE_PATH=$1;

if [[ ! -d "$FILE_PATH" ]]; then
    echo 'Path argument not defined';
    exit;
fi;

chmod 775 ${FILE_PATH} -R && \
chmod 2775 ${FILE_PATH} -R && \
chown -R www-data:www-data ${FILE_PATH} -R;

if [[ ! -z $(ls -A .) ]]; then
    cd ${FILE_PATH} && find * -type d -exec chmod -R 775 {} \; && find * -type f -exec chmod -R 664 {} \;
else
    echo 'Path is empty, not running commands for children.';
fi;
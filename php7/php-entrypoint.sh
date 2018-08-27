#!/bin/bash
set -e

for project in $(ls)
do
    if [ -f "$project/composer.json" ] && [ ! -d "$project/vendor" ]; then
        cd $project
        echo "composer is installing dependent packages for $(pwd) ..."
        $(composer install)
        if [ $? == 0 ]; then
            echo "------installation is compeleted for $(pwd)!-----"
        else
            echo "******please install it manually for $(pwd)!*****"
        fi
        cd ../
    fi
done

exec "$@"

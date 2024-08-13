#!/bin/bash
v=$(hostname -I | awk '{print $1}')
php artisan serve --host=$(echo $v) --port=8080

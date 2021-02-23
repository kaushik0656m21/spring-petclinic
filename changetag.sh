#! /bin/bash
sed "s/BUILD_NUMBER/$1/g" deploy.yml > deploy.yml

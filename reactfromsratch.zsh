#!/bin/zsh

# This script creates a barebones react application to build from.

# currently requires prior download of npm, git, jq 

# stores directory of shell script to copy base files from
scrptDir=$(dirname $0)

# initialize npm and install dependencies
npm init
npm i react react-dom
npm i --save-dev path webpack webpack-cli webpack-dev-server
npm i --save-dev @babel/core @babel/cli babel-loader @babel/preset-env @babel/preset-react @babel/plugin-transform-runtime @babel/runtime @babel/eslint-parser
npm i --save-dev eslint eslint-config-airbnb-base eslint-config-prettier eslint-plugin-jest

# initialize git
git init
cp $scrptDir/src/.gitignore ./.gitignore

# editing index.js file path and writing start/build scripts to package.json
jq '.main = "src/index.js"' package.json > temp && mv temp package.json
jq '.scripts |= . + {"start": "webpack-dev-server .", "build": "webpack .",}' package.json > temp && mv temp package.json

# create directories for source code and public files
mkdir src public 

# copy from src folder default configuration files
cp $scrptDir/src/App.js ./src/App.js

cp $scrptDir/src/index.js ./src/index.js

cp $scrptDir/src/index.html ./public/index.html

cp $scrptDir/src/webpack.config.js ./webpack.config.js

cp $scrptDir/src/babel.config.json ./babel.config.json
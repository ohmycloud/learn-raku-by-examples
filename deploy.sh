#!/bin/bash
ssh-add ~/.ssh/id_rsa
git add .
git commit -m "learning raku by  example"
git push origin master

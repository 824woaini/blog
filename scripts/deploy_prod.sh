#!/bin/bash
cd blog
hugo

# Deploy to prod
rsync -av --delete public/ yusuke921@yusuke921.sakura.ne.jp:~/www/nslifestyle.com


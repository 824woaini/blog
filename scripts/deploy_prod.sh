#!/bin/bash
cd blog

# Deploy to prod
rsync -av --delete public/ yusuke921@yusuke921.sakura.ne.jp:~/www/nslifestyle.com


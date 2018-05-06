#!/bin/bash
cd blog
hugo

# =========================
# GZIP All Html, css and js
# =========================
find _site/ -iname '*.html' -exec gzip -n {} +
find _site/ -iname '*.js' -exec gzip -n {} +
find _site/ -iname '*.css' -exec gzip -n {} +
find _site/ -iname '*.gz' -exec rename 's/\.gz$//i' {} +
echo done.

# =========================
# Add .htaccess
# =========================
echo '
# =========================
# 404 settings
# =========================
ErrorDocument 404 /404.html

# =========================
# Set Gzip for Sakura Server
# =========================
RewriteEngine on
RewriteCond %{HTTP:Accept-Encoding} gzip
RewriteCond %{REQUEST_FILENAME} \.js$ [OR]
RewriteCond %{REQUEST_FILENAME} \.css$
RewriteCond %{REQUEST_FILENAME} !\.gz$
RewriteCond %{REQUEST_FILENAME}\.gz -s
RewriteRule .+ %{REQUEST_URI}.gz

<FilesMatch "\.js\.gz$">
 ForceType application/x-javascript
 AddEncoding x-gzip .gz
</FilesMatch>

<FilesMatch "\.css\.gz$">
 ForceType text/css
 AddEncoding x-gzip .gz
</FilesMatch>

<FilesMatch "\.html\.gz$">
 ForceType text/html
 AddEncoding x-gzip .gz
</FilesMatch>

# =========================
# Set caching
# =========================
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresDefault "access plus 1 second"
  ExpiresByType text/css "access plus 1 year"
  ExpiresByType text/js "access plus 1 year"
  ExpiresByType text/javascript "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/svg+xml "access plus 1 year"
  ExpiresByType application/pdf "access plus 1 year"
  ExpiresByType application/javascript "access plus 1 year"
  ExpiresByType application/x-javascript "access plus 1 year"
  ExpiresByType application/x-shockwave-flash "access plus 1 year"
  ExpiresByType application/x-font-ttf "access plus 1 year"
  ExpiresByType application/x-font-woff "access plus 1 year"
  ExpiresByType application/x-font-opentype "access plus 1 year"
  ExpiresByType application/vnd.ms-fontobject "access plus 1 year"
</IfModule>
' > public/.htaccess

# Deploy to prod
rsync -av --delete public/ yusuke921@yusuke921.sakura.ne.jp:~/www/nslifestyle.com


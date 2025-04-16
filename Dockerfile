# Utilise l'image officielle PHP avec Apache
FROM php:8.3-apache

# Active le module Apache mod_rewrite 
RUN a2enmod rewrite

# Installe les extensions PHP nécessaires 
RUN docker-php-ext-install pdo pdo_mysql

# Copie tout le code dans /var/www/html
COPY . /var/www/html

# Définit le dossier 'public' comme DocumentRoot
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Reconfigure Apache pour que le DocumentRoot soit 'public'
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf \
 && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf

# Donne les bons droits au dossier 
RUN chown -R www-data:www-data /var/www/html

# Port exposé
EXPOSE 80

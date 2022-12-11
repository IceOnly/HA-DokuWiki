#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: DokuWiki
# Configures DokuWiki
# ==============================================================================

if ! bashio::fs.directory_exists '/share/dokuwiki/'; then
    mkdir -p /share/dokuwiki \
        || bashio::exit.nok "Failed to create dokuwiki share directory"

    # Copy in template files
    cp -r /dokuwiki/data/ /share/dokuwiki/
fi

chmod -R 777 /share/dokuwiki/data/

title=$(bashio::config 'title')
start=$(bashio::config 'start')
lang=$(bashio::config 'lang')
template=$(bashio::config 'template')
tagline=$(bashio::config 'tagline')

sed -i "s/%%TITLE%%/${title}/" "/dokuwiki/conf/local.php"
sed -i "s/%%START%%/${start}/" "/dokuwiki/conf/local.php"
sed -i "s/%%LANG%%/${lang}/" "/dokuwiki/conf/local.php"
sed -i "s/%%TEMPLATE%%/${template}/" "/dokuwiki/conf/local.php"
sed -i "s/%%TAGLINE%%/${tagline}/" "/dokuwiki/conf/local.php"

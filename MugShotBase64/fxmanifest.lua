fx_version 'adamant'
game 'gta5'

name "MugShotBase64"
description 'A script can convert peds mugshot image to Base64 encoding to save that as save and manage that'
author "BaziForYou#9907"

ui_page 'html/index.html'

files {
  "html/js/script.js",
  "html/index.html",
}
client_script {
  "client.lua",
}

export "GetMugShotBase64"

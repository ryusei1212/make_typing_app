// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// import .から始めてpathを記述することでjsファイルを読み込む

// cocoonのjsライブラリとjQueryをRails側に認識させる
require("jquery")
require("@nathanvda/cocoon")


// CSS,bootstrapの読み込み
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/type";



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//

// Webpackerに画像ファイルをインポートする
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

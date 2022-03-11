const { environment } = require('@rails/webpacker')

// jQueryをRailsに認識させる
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// ここまで

module.exports = environment

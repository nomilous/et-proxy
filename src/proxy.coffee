module.exports = 

    Proxy : class Proxy



        constructor: (config) -> 

            console.log 'init Proxy'

            @url = config.url


        get: (path, callback, params) -> 

            console.log 'Proxy.get', @url + path, callback

            require('http').get @url + path, (res) ->
        
                res.on 'data', (data) -> 

                    callback data

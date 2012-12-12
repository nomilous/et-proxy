module.exports = 

    Proxy : class Proxy

        constructor: (config) -> 

            console.log 'init EtProxy with ', config

        get: (path, params, callback) -> 

            console.log 'Proxy.get', path, params, callback

            error = null

            callback "fake data", error


jasmine = require 'jasmine-node'
should  = require 'should'
Proxy   = require('../lib/proxy').Proxy


# 
# set up a test app to proxy to
# 

testUrl = "http://localhost:#{  port  }"
server  = null
port    = 1266
app     = require('express')()


app.get '/planets/i', (req, res) -> res.send 'mercury'



describe 'Proxy', -> 

    beforeEach ->

        server = app.listen port

        @subject = new Proxy

            url: "http://localhost:#{  port  }"
            username: 'Niccolò Polo'
            password: 'paiza'


    it 'can get()', -> 

        #
        # 1st: overly simple 
        # 
        # - stomped on buffer 
        # - and headers 
        # - and possibiliy of multipart response
        #

        @subject.get '/planets/i', (response, err) => 

            server.close()
            response.toString().should.equal 'mercury'

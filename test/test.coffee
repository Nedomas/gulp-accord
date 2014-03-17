should = require 'should'
gutil = require 'gulp-util'
accord = require '..'

stub_file = (name, contents) ->
  new gutil.File
    path: "./test/fixtures/#{name}"
    cwd: './test'
    base: './test/fixtures/'
    contents: new Buffer(contents)

describe 'basic', ->

  it 'should compile with options', (done) ->
    expect = 0
    stub = stub_file('file.jade', "p wow\np such test")
    stream = accord('jade', { pretty: true })

    stream.on 'data', (data) ->
      data.should.eql('\n<p>wow</p>\n<p>such test</p>')
      expect++

    stream.once 'end', ->
      expect.should.equal(1)
      done()

    stream.write(stub)
    stream.end()

  it 'should handle compile errors'
  it 'should handle plugin input errors'



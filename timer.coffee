CronJob = require('cron').CronJob
Rx = require 'rx'
_ = require 'lodash'

_.map [1,2], (i) ->
  new CronJob '0 * * * * *',
    =>
      hello {'type':i}
  , null, true

_.map [1,2], (i) ->
  new CronJob '0 * * * * *',
    =>
      hello {'type':i}
  , null, true


hello = (value) ->
  console.log value, new Date()
  subject.onNext value

outPut = (val) ->
  console.log val, new Date()


subject = new Rx.Subject()


# myInterval = Rx.Observable.interval(500)

bufferTime = subject.bufferTime(20000)
             .filter (x) ->
               x.length >= 2
subscribe = bufferTime.subscribe (vals) =>
  # console.log 'Buffered with Time:', val, new Date()
  _.map _.uniqBy(vals, 'type'), (val) ->
    outPut val.type

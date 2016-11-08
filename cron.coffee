CronJob = require('cron').CronJob
_ = require "lodash"
tt = (st) ->
  console.log st, new Date()

_.map [1,2], (i) ->
  new CronJob '*/5 * * * * *', _.throttle(
    =>
      hello i
    , 2000)
  , null, true
#
#
# _.map [1,2], (i) ->
#   new CronJob '*/5 * * * * *', =>
#     hello i
#   , null, true
#
#
# Rx = require "rx"
# _ = require "lodash"
# redis_data = new Rx.Subject()
#
# redis_river_source = redis_data.bufferWithTimeOrCount(1000, 3)
#   .filter (x) ->
#     x.length > 0
#   .pausableBuffered()
#
# result = []
#
# hello = (sf) ->
#
#   redis_river_source.subscribe (bulkStr) =>
#     # result = []
#     console.log bulkStr
#     # result.push(bulkStr[0])
#     if bulkStr.length is 6
#       console.log 'hahahahah'
#       tt bulkStr
#
#
#   redis_river_source.resume()
#
#   redis_data.onNext sf
#
# console.log result

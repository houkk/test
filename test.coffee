Rx = require "rx"
_ = require "lodash"
redis_data = new Rx.Subject()

redis_river_source = redis_data.bufferWithTimeOrCount(1, 1)
  .filter (x) ->
    x.length > 0
  .pausableBuffered()

result = []
redis_river_source.subscribe (bulkStr) =>
  result.push(bulkStr[0])
  # bulkStr[0]()
  # redirectToES bulkStr[0]

redis_river_source.resume()
hello = () ->
  console.log 'start ---------->'
  console.log 'z --------->'

redirectToES = (bulkstr) ->
  console.log '----< ', bulkstr
# redis_data.onNext [1,2]
redis_data.onNext 1
redis_data.onNext 3
redis_data.onNext 3

redis_data.onNext 3
redis_data.onNext 3
redis_data.onNext 3
redis_data.onNext 4
redis_data.onNext 5
redis_data.onNext 6
redis_data.onNext 7
redis_data.onNext 8
redis_data.onNext 9
redis_data.onNext 10

setTimeout () ->
  redis_data.onNext 2
, 4000
console.log result

# redis_data.onNext 2
# redis_data.onNext 3
# redis_data.onNext 5
# redis_data.onNext 6
# redis_data.onNext 7
# redis_data.onNext 8

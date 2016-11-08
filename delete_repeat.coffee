a = [{type:'1'},{type:'1'},{type:'1'},{type:'1'} ]
_ = require 'lodash'

result = _.uniqBy(a, 'type')
console.log result

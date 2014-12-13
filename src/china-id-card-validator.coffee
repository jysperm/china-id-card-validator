_ = require 'underscore'


availableZonePrefix = _.flatten [
  _.range 11, 16
  _.range 21, 24
  _.range 31, 38
  _.range 41, 47
  _.range 50, 55
  _.range 61, 66
  71, 81, 82, 91
]


weightingFactor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
checkNumber = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2]


module.exports = (idCard) ->
  try
    unless idCard
      return false

    unless _.isString idCard
      return false

    regex = /^(\d{6})(\d{8})(\d{3})(\d|[Xx])$/
    [__, zone, birthday, uniquenum, checksum] = idCard.match regex

    unless parseInt(zone[... 2]) in availableZonePrefix
      return false

    [__, year, month, day] = birthday.match /^(\d{4})(\d{2})(\d{2})$/

    maxYear = (new Date).getFullYear()
    min_year = new Date Date.now() - 122 * 365 * 24 * 3600 * 1000

    unless maxYear >= parseInt(year) >= min_year
      return false

    unless 12 >= parseInt(month, 10) >= 1
      return false

    unless 31 >= parseInt(day, 10) >= 1
      return false

    sum = _.reduce idCard[... 17].split(''), (memo, value, index) ->
      return memo + parseInt(value) * weightingFactor[index]
    , 0

    unless checksum.toUpperCase() == checkNumber[sum % 11].toString()
      return false

    return true

  catch err
    return false

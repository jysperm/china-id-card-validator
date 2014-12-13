var availableZonePrefix, checkNumber, weightingFactor, _,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

_ = require('underscore');

availableZonePrefix = _.flatten([_.range(11, 16), _.range(21, 24), _.range(31, 38), _.range(41, 47), _.range(50, 55), _.range(61, 66), 71, 81, 82, 91]);

weightingFactor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];

checkNumber = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2];

module.exports = function(idCard) {
  var birthday, checksum, day, err, maxYear, min_year, month, regex, sum, uniquenum, year, zone, __, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
  try {
    if (!idCard) {
      return false;
    }
    if (!_.isString(idCard)) {
      return false;
    }
    regex = /^(\d{6})(\d{8})(\d{3})(\d|[Xx])$/;
    _ref = idCard.match(regex), __ = _ref[0], zone = _ref[1], birthday = _ref[2], uniquenum = _ref[3], checksum = _ref[4];
    if (_ref1 = parseInt(zone.slice(0, 2)), __indexOf.call(availableZonePrefix, _ref1) < 0) {
      return false;
    }
    _ref2 = birthday.match(/^(\d{4})(\d{2})(\d{2})$/), __ = _ref2[0], year = _ref2[1], month = _ref2[2], day = _ref2[3];
    maxYear = (new Date).getFullYear();
    min_year = new Date(Date.now() - 122 * 365 * 24 * 3600 * 1000);
    if (!((maxYear >= (_ref3 = parseInt(year)) && _ref3 >= min_year))) {
      return false;
    }
    if (!((12 >= (_ref4 = parseInt(month, 10)) && _ref4 >= 1))) {
      return false;
    }
    if (!((31 >= (_ref5 = parseInt(day, 10)) && _ref5 >= 1))) {
      return false;
    }
    sum = _.reduce(idCard.slice(0, 17).split(''), function(memo, value, index) {
      return memo + parseInt(value) * weightingFactor[index];
    }, 0);
    if (checksum.toUpperCase() !== checkNumber[sum % 11].toString()) {
      return false;
    }
    return true;
  } catch (_error) {
    err = _error;
    return false;
  }
};

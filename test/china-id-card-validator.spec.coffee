require 'coffee-errors'

chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
chinaIdCardValidator = require '../lib/china-id-card-validator.js'

expect = chai.expect
chai.use require 'sinon-chai'

describe 'china-id-card-validator', ->
  it 'should success', ->
    id_cards = [
      '11010519491231002X'
      '11010519491231002x'
      '440524188001010014'
      '11010519491231002X'
      '440524188001010014'
      '210105199511250210'
    ]

    for id_card in id_cards
      expect(chinaIdCardValidator(id_card)).to.equal true


  it 'should fail', ->
    id_cards = [
      '11010519491231ABCD'
      '440524188001010013'
      '01010519491231002X'
      '440524178001010014'
      '440524218001010014'
    ]

    for id_card in id_cards
      expect(chinaIdCardValidator(id_card)).to.equal false


  it 'should return false without idCard', ->
    expect(chinaIdCardValidator()).to.equal false


  it 'should return false when idCard is not a string', ->
    idCards = [
      1
      null
      undefined
      [1, 2]
      {a: 1}
      ()->
        return 1
    ]
    for idCard in idCards
      expect(chinaIdCardValidator(idCard)).to.equal false


  it 'should return false when birthday is wrong', ->
    idCards = [
      '110228199421010014'
      '110228199401410014'
    ]
    for idCard in idCards
      expect(chinaIdCardValidator(idCard)).to.equal false

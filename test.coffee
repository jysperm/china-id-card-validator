assert = require 'assert'
validator = require './'

describe 'china-id-card-validator', ->
  it 'should success', ->
    id_cards = [
      '11010519491231002X'
      '440524188001010014'
      '11010519491231002X'
      '440524188001010014'
      '210105199511250210'
    ]

    for id_card in id_cards
      assert.equal validator(id_card), true

  it 'should fail', ->
    id_cards = [
      '11010519491231ABCD'
      '440524188001010013'
      '01010519491231002X'
      '440524178001010014'
      '440524218001010014'
    ]

    for id_card in id_cards
      assert.equal validator(id_card), false

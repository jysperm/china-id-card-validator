# china-id-card-validator
中华人民共和国公民身份号码验证工具。

[![Dependency status](http://img.shields.io/david/jysperm/china-id-card-validator.svg?style=flat)](https://david-dm.org/jysperm/china-id-card-validator)
[![devDependency Status](http://img.shields.io/david/dev/jysperm/china-id-card-validator.svg?style=flat)](https://david-dm.org/jysperm/china-id-card-validator#info=devDependencies)
[![Build Status](http://img.shields.io/travis/jysperm/china-id-card-validator.svg?style=flat&branch=master)](https://travis-ci.org/jysperm/china-id-card-validator)

[![NPM](https://nodei.co/npm/china-id-card-validator.svg?style=flat)](https://npmjs.org/package/china-id-card-validator)

## Installation

    npm install china-id-card-validator

## Usage Example

    validator = require 'china-id-card-validator'

    assert.equal validator('11010519491231002X'), true
    assert.equal validator('11010519491231ABCD'), false

## Testing

    npm test

## References:

* [GB 11643 公民身份号码](http://zh.wikisource.org/wiki/GB_11643-1999_%E5%85%AC%E6%B0%91%E8%BA%AB%E4%BB%BD%E5%8F%B7%E7%A0%81)
* [GB/T 2260 中华人民共和国行政区划代码](http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/201401/t20140116_501070.html)
* [维基百科：最长寿者](http://zh.wikipedia.org/wiki/%E6%9C%80%E5%B9%B4%E9%95%B7%E8%80%85)


## License

The MIT License (MIT)

Copyright 2014 王子亭

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

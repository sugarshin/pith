# pith

**incomplete**

[![Build Status](https://travis-ci.org/sugarshin/pith.svg?branch=master)](https://travis-ci.org/sugarshin/pith) [![Coverage Status](https://coveralls.io/repos/sugarshin/pith/badge.svg)](https://coveralls.io/r/sugarshin/pith) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Fpith.svg)](http://badge.fury.io/gh/sugarshin%2Fpith) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

Pith

Ultra simple mvc base framework

```shell
npm i sugarshin/pith
```

## Usage

```coffeescript
Pith = require 'pith'

class MyModel extends Pith.Model

class MyView extends Pith.View
```

or

```html
<script src="pith.js"></script>
<script>
var MyModel = Pith.Model.extends({});
var MyView = Pith.View.extends({});
</script>
```

## Contributing

[CoffeeScript](//coffeescript.org/)

[mocha-phantomjs](//github.com/metaskills/mocha-phantomjs)

[power-assert](//github.com/twada/power-assert)

```shell
npm test
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin

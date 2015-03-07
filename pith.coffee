###!
 * @license pith
 * (c) sugarshin
 * License: MIT
###

"use strict"

do (root = this, factory = ->
  previousPith = Pith

  class Eventz

    constructor: ->
      @_events = {}

    on: (event, handler) ->
      @_events or= {}
      if typeof handler isnt 'function'
        throw new Error 'on only accepts instances of Function'
      @_events[event] or= []
      @_events[event].push handler
      return this

    once: (event, handler) ->
      @on event, _self = =>
        @off event, _self
        handler.apply @, arguments
      return this

    off: (event, handler) ->
      unless event
        @_events or= {}
        return this
      callbacks = @_events?[event]
      unless callbacks then return this
      if handler
        for cb, i in callbacks when cb is handler
          callbacks.splice i, 1
          @_events[event] = callbacks
      else
        delete @_events[event]
      return this

    emit: (args...) ->
      event = args.shift()
      callbacks = @_events?[event]
      unless callbacks then return this
      for cb in callbacks
        if cb.apply(@, args) is false then break
      return this

    # Alias
    addListener: @::on
    removeListener: @::off
    trigger: @::emit

  class Base extends Eventz
    constructor: (@attrs) ->
    get: (name) -> @attrs[name]
    set: (name, val) -> @attrs[name] = val
    @extends: (child, parent) ->
      ctor = ->
        @constructor = child
        return
      for key of parent
        if parent.hasOwnProperty(key)
          child[key] = parent[key]
      ctor.prototype = parent.prototype
      child.prototype = new ctor
      child.__super__ = parent.prototype
      return child

  class Model extends Base

  class View extends Base

  class Pith
    # Current version of the library. Keep in sync with `package.json`.
    @VERSION = '0.0.1'

    @noConflict: ->
      root.Pith = previousPith
      return this

    @Model: Model

    @View: View

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory()
  else
    root.Pith or= factory()
  return

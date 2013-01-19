define [
    "kinetic"
], (Kinetic) ->

    class Screen

        constructor: (@_game, @_width = @_game.getWidth(), @_height = @_game.getHeight()) ->
            @_layer = new Kinetic.Layer
            @_constructLayout()

        # Abstract
        _constructLayout: ->
            throw new Error "Cannot invoke abstract method Screen._constructLayout."

        redraw: ->
            @_layer.draw()

        getLayer: ->
            @_layer

        getWidth: ->
            @_width

        getHeight: ->
            @_height

        registerOnClickListener: (element, listener) ->
            element.on "click tap", ->
                listener element


    return Screen
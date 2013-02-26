define [
    "kinetic"
    "sm2"
], (Kinetic, SM2) ->

    class Screen

        constructor: (@_game, @_width = @_game.getWidth(), @_height = @_game.getHeight()) ->
            @_layer = new Kinetic.Layer

            backgroundMusicName = @_getBackgroundMusicName()
            @_backgroundMusic = SM2.createSound id: backgroundMusicName if backgroundMusicName?

        init: ->
            @_constructLayout()
            @_constructInputEvents @_game.getInputController()
            @_playBackgroundMusic()
            @redraw()

        destroy: ->
            @_destroyInputEvents @_game.getInputController()
            @_stopBackgroundMusic()
            @_layer.remove()

        # Abstract
        _constructLayout: ->
            throw new Error "Cannot invoke abstract method Screen._constructLayout()."

        # Abstract
        _constructInputEvents: (inputController) ->
            throw new Error "Cannot invoke abstract method Screen._constructInputEvents(inputController)."

        # Abstract
        _destroyInputEvents: (inputController) ->
            throw new Error "Cannot invoke abstract method Screen._destroyInputEvents(inputController)."

        # Abstract
        _getBackgroundMusicName: ->
            # TODO throw new Error "Cannot invoke abstract method Screen._getBackgroundMusicName()."

        _playBackgroundMusic: ->
            return unless @_backgroundMusic?

            @_backgroundMusic.play onfinish: =>
                @_playBackgroundMusic()

        _stopBackgroundMusic: ->
            return unless @_backgroundMusic?

            @_backgroundMusic.stop()

        redraw: ->
            @_layer.draw()

        getLayer: ->
            @_layer

        getWidth: ->
            @_width

        getHeight: ->
            @_height


    return Screen
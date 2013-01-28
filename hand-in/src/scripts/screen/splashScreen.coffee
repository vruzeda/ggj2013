define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "screen/loadingScreen"
], (Kinetic, Screen, ImageLoader, LoadingScreen) ->

    class SplashScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Rect
                width: @getWidth()
                height: @getHeight()
                fill: "black"

            ImageLoader.addToList
                LOADING_SCREEN:
                    flubber: "images/flubber.png"

            ImageLoader.loadImages
                list: ["LOADING_SCREEN"]

                progressCallback: (total, complete, success) ->

                completeCallback: =>
                    @_game.showScreen new LoadingScreen @_game
                    @_game.hideScreen @

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return SplashScreen
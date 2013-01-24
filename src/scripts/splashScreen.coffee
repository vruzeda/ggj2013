define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "loadingScreen"
], (Kinetic, Screen, ImageLoader, LoadingScreen) ->

    class SplashScreen extends Screen

        _constructLayout: ->
            rect = new Kinetic.Rect
                width:  @getWidth()
                height: @getHeight()
                fill: "red"
                opacity: 0
            @_layer.add rect

            ImageLoader.addToList
                IMPLICIT_TECHNOLOGIES:
                    html5: "http://www.w3schools.com/html/img_html5_html5.gif"
                    nodejs: "http://nodejs.org/images/logo.png"
                    git: "http://git-scm.com/images/logo@2x.png"

            required =
                list: ["IMPLICIT_TECHNOLOGIES"]

                progressCallback: (total, complete, success) =>
                    rect.setOpacity complete / total
                    @redraw()

                completeCallback: =>
                    @_game.showScreen new LoadingScreen @_game
                    @_game.hideScreen @

            background =
                list: []
                progressCallback: null
                completeCallback: null

            ImageLoader.loadImages required, background

        _constructInputEvents: (inputController) ->


    return SplashScreen
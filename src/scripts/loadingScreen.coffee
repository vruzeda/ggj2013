define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "simpleScreen"
], (Kinetic, Screen, ImageLoader, SimpleScreen) ->

    class LoadingScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Rect
                width: @getWidth()
                height: @getHeight()
                fill: "blue"

            text = new Kinetic.Text
                text: 'Loading...'
                width:  @getWidth()
                align: "center"
                fontSize: 36,
                fill: "black",
                textStroke: "white",
                textStrokeWidth: 1,
            text.setY (@getHeight() - text.getTextHeight()) / 2
            @_layer.add text

            ImageLoader.addToList
                EXPLICIT_TECHNOLOGIES:
                    coffescript: "http://coffeescript.org/documentation/images/logo.png"
                    require:     "http://requirejs.org/i/logo.png"
                    kinetic:     "http://kineticjs.com/img/logo.png"
                    jquery:      "http://api.jquery.com/jquery-wp-content/themes/jquery/images/logo-jquery.png"

            required =
                list: ["EXPLICIT_TECHNOLOGIES"]

                progressCallback: (total, complete, success) =>
                    text.setText "Loading (#{Math.round complete / total * 100}%)"
                    @redraw()

                completeCallback: =>
                    @_game.showScreen new SimpleScreen @_game
                    @_game.hideScreen @

            background =
                list: []
                progressCallback: null
                completeCallback: null

            ImageLoader.loadImages required, background

        _constructInputEvents: (inputController) ->


    return LoadingScreen
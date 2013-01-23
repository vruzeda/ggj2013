define [
    "framework/game"
    "splashScreen"
], (Game, SplashScreen) ->

    class SimpleGame extends Game

        _getInitialScreen: ->
            new SplashScreen @


    return SimpleGame
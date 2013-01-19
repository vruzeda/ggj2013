define [
    "framework/game"
    "simpleScreen"
], (Game, SimpleScreen) ->

    class SimpleGame extends Game

        _getInitialScreen: ->
            new SimpleScreen @


    return SimpleGame
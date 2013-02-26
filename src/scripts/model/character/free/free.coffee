define [
    "model/character/characterState"
], (CharacterState) ->

    class Free extends CharacterState

        _getPulse: ->
            "free"

        _getState: ->
            "free"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            30

        isFree: ->
            true


    return Free
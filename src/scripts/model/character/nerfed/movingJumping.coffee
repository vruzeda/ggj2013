define [
    "model/character/nerfed/jumping"
], (Jumping) ->

    class MovingJumping extends Jumping

        _getState: ->
            "movingJumping"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..7]

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return MovingJumping
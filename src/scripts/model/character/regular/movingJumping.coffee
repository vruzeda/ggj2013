define [
    "model/character/regular/jumping"
], (Jumping) ->

    class MovingJumping extends Jumping

        _getState: ->
            "movingJumping"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getNumberOfSpritesheetFrames: ->
            8

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return MovingJumping
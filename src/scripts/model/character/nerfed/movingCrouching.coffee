define [
    "model/character/nerfed/crouching"
], (Crouching) ->

    class MovingCrouching extends Crouching

        _getState: ->
            "movingCrouching"

        _getSpriteWidth: ->
            343

        _getSpriteHeight: ->
            195

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            1

        isMoving: ->
            true


    return MovingCrouching
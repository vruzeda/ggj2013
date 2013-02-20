define [
    "model/character/nerfed/basePulse"
    "sm2"
], (BasePulse, SM2) ->

    class Moving extends BasePulse

        setup: ->
            @_sprite.afterFrame 1, =>
                SM2.play 'move3'
                @setup()

        _getState: ->
            "moving"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return Moving
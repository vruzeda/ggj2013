define [
    "sm2"
    "model/character/nerfed/basePulse"
], (SM2, BasePulse) ->

    class Moving extends BasePulse

        setup: ->
            @_characterNode.afterFrame 1, =>
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
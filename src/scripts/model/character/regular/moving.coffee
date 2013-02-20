define [
    "sm2"
    "model/character/regular/basePulse"
], (SM2, BasePulse) ->

    class Moving extends BasePulse

        setup: ->
            @_characterNode.afterFrame 1, =>
                SM2.play 'move1'
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
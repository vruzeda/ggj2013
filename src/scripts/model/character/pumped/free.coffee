define [
    "model/character/pumped/basePulse"
], (BasePulse) ->

    class Free extends BasePulse

        _getState: ->
            "standing"

        _getPulse: ->
            "pumped"

        isFree: ->
            true


    return Free
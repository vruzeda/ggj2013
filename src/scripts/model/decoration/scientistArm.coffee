define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    {SCIENTIST: {ARM}} = Constants

    class ScientistArm extends Decoration

        constructor: (@_character, @_scientist) ->
            super ARM.width, ARM.height, "arm"

        getPosition: ->
            characterPosition = @_character.getPosition()
            scientistPosition = @_scientist.getPosition()

            x: scientistPosition.x + ARM.xDisplacement, y: characterPosition.y + ARM.yDisplacement

    return ScientistArm
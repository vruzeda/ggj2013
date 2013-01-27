define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    {SCIENTIST} = Constants

    class Scientist extends Decoration

        constructor: ->
            super SCIENTIST.width, SCIENTIST.height
            @_speed = SCIENTIST.speed

        getImageName: ->
            "scientist"

        update: (deltaTime) ->
            position = @getPosition()
            @setPosition x: position.x + @_speed*deltaTime, y: position.y
            @_speed = Math.max (SCIENTIST.maxSpeed, @_speed + SCIENTIST.aceleration*deltaTime)



    return Scientist
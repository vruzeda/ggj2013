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
            if @_speed < SCIENTIST.maxSpeed
                @_speed += SCIENTIST.aceleration



    return Scientist
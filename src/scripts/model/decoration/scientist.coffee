define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    {SCIENTIST} = Constants

    class Scientist extends Decoration

        constructor: ->
            super SCIENTIST.width, SCIENTIST.height, "scientist"

            @_speed = SCIENTIST.speed
            @_accumulatedTime = 0

        update: (deltaTime) ->
            @_accumulatedTime += deltaTime

            position = @getPosition()
            newPositionX = position.x + @_speed * deltaTime
            newPositionY = 20 * Math.sin(10 * @_accumulatedTime) - 20

            @setPosition x: newPositionX, y: newPositionY
            @_speed = Math.max SCIENTIST.maxSpeed, @_speed + SCIENTIST.aceleration * deltaTime



    return Scientist
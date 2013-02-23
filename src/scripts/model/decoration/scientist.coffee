define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    {SCIENTIST} = Constants

    class Scientist extends Decoration

        constructor: ->
            super SCIENTIST.width, SCIENTIST.height, "scientist"

            @setPosition x: SCIENTIST.x, y: SCIENTIST.y
            @_speed = SCIENTIST.speed
            @_accumulatedTime = 0

        update: (deltaTime) ->
            @_accumulatedTime += deltaTime

            position = @getPosition()
            newPositionX = position.x + @_speed * deltaTime
            newPositionY = position.y + 5 * Math.sin 10 * @_accumulatedTime

            @setPosition x: newPositionX, y: newPositionY
            @_speed = Math.min SCIENTIST.maxSpeed, @_speed + SCIENTIST.aceleration * deltaTime



    return Scientist
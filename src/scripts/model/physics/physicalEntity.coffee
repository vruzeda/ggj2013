define [], ->

    class PhysicalEntity

        constructor: (@_width, @_height) ->
            @_position = x: 0, y: 0
            @_speed = x: 0, y: 0

        getWidth: ->
            @_width

        getHeight: ->
            @_height

        getPosition: ->
            x: @_position.x, y: @_position.y

        setPosition: (position) ->
            @_position = x: position.x, y: position.y

        moveBy: (delta) ->
            @setPosition x: @_position.x + delta.x, y: @_position.y + delta.y

        getSpeed: ->
            x: @_speed.x, y: @_speed.y

        setSpeed: (speed) ->
            @_speed = x: speed.x, y: speed.y

        # Abstract
        getImageName: ->
            throw new Error "Cannot invoke abstract method PhysicalEntity.getImageName()."

        collidesWith: (that, delta) ->
            thisTL = @_topLeft()
            thisTR = @_topRight()
            thisBL = @_bottomLeft()
            thisBR = @_bottomRight()

            thatTL = that._topLeft()
            thatTR = that._topRight()
            thatBL = that._bottomLeft()
            thatBR = that._bottomRight()

            clonedDelta = x: delta.x, y: delta.y

            unless thisTL.x + clonedDelta.x > thatTR.x or thisTR.x + clonedDelta.x < thatTL.x or thisTL.y + clonedDelta.y > thatBL.y or thisBL.y + clonedDelta.y < thatTL.y
                if clonedDelta.x > 0 and thisTR.x + clonedDelta.x > thatTL.x then clonedDelta.x = thatTL.x - thisTR.x
                if clonedDelta.x < 0 and thisTL.x + clonedDelta.x < thatTR.x then clonedDelta.x = thatTR.x - thisTL.x
                if clonedDelta.y > 0 and thisBL.y + clonedDelta.y > thatTL.y then clonedDelta.y = thatTL.y - thisBL.y
                if clonedDelta.y < 0 and thisTL.y + clonedDelta.y < thatBL.y then clonedDelta.y = thatBL.y - thisTL.y

            return clonedDelta

        _topLeft:     -> x: @_position.x,           y: @_position.y
        _topRight:    -> x: @_position.x + @_width, y: @_position.y
        _bottomLeft:  -> x: @_position.x,           y: @_position.y + @_height
        _bottomRight: -> x: @_position.x + @_width, y: @_position.y + @_height


    return PhysicalEntity
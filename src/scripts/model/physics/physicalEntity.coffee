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

        collidesRightWith: (that, deltaX) ->
            thisTR = @_topRight()
            thisBR = @_bottomRight()

            thatTL = that._topLeft()
            thatTR = that._topRight()
            thatBL = that._bottomLeft()

            thisTR.x += deltaX
            thisBR.x += deltaX

            if thatTL.x <= thisTR.x <= thatTR.x
                if thatTL.y <= thisTR.y <= thatBL.y or thatTL.y <= thisBR.y <= thatBL.y
                    deltaX = thatTL.x - thisTR.x

            return deltaX

        collidesLeftWith: (that, deltaX) ->
            thisTL = @_topLeft()
            thisBL = @_bottomLeft()

            thatTR = that._topRight()
            thatTL = that._topLeft()
            thatBR = that._bottomRight()

            thisTL.x += deltaX
            thisBL.x += deltaX

            if thatTL.x <= thisTL.x <= thatTR.x
                if thatTR.y <= thisTL.y <= thatBR.y or thatTR.y <= thisBL.y <= thatBR.y
                    deltaX = thatTR.x - thisTL.x

            return deltaX

        collidesTopWith: (that, deltaY) ->
            thisTL = @_topLeft()
            thisTR = @_topRight()

            thatTR = that._topRight()
            thatTL = that._topLeft()
            thatBR = that._bottomRight()

            thisTL.y += deltaY
            thisTR.y += deltaY

            if thatTR.y <= thisTL.y <= thatBR.y
                if thatTL.x <= thisTL.x <= thatBR.x or thatTL.x <= thisTR.x <= thatBR.x
                    deltaY = thatBR.y - thisTL.y

            return deltaY

        collidesBottomWith: (that, deltaY) ->
            thisBL = @_bottomLeft()
            thisBR = @_bottomRight()

            thatTR = that._topRight()
            thatTL = that._topLeft()
            thatBR = that._bottomRight()

            thisBL.y += deltaY
            thisBR.y += deltaY

            if thatTR.y <= thisBL.y <= thatBR.y
                if thatTL.x <= thisBL.x <= thatBR.x or thatTL.x <= thisBR.x <= thatBR.x
                    deltaY = thatTR.y - thisBR.y

            return deltaY

        _topLeft:     -> x: @_position.x,           y: @_position.y
        _topRight:    -> x: @_position.x + @_width, y: @_position.y
        _bottomLeft:  -> x: @_position.x,           y: @_position.y + @_height
        _bottomRight: -> x: @_position.x + @_width, y: @_position.y + @_height


    return PhysicalEntity
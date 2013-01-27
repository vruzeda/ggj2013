define [
    "model/constants"
    "model/physics/physicalEntity"
], (Constants, PhysicalEntity) ->

    {CHARACTER} = Constants

    class Character extends PhysicalEntity

        constructor: ->
            super CHARACTER.width, CHARACTER.height

            @setState "standing"
            @setPulse "regular"

        getHeartBeat: ->
            @_heartRate

        resetHeartBeat: ->
            @_heartRate = CHARACTER["#{@_pulse}HeartBeat"]

        increaseHeartBeat: ->
            @_heartRate += CHARACTER.heartBeatIncrement

            if @_heartRate >= CHARACTER.heartAttackHeartBeat
                @setState "captured"
                @setPulse "heartAttack"

            else if @_heartRate >= CHARACTER.pumpedHeartBeat
                @setPulse "pumped"

            else if @_heartRate >= CHARACTER.regularHeartBeat
                @setPulse "regular"

        decreaseHeartBeat: (deltaTime) ->
            @_heartRate -= CHARACTER.heatBeatDecerementByTime * deltaTime

            if @_heartRate <= CHARACTER.cardiacArrestHeartBeat
                @setState "captured"
                @setPulse "cardiacArrest"

            else if @_heartRate <= CHARACTER.nerfedHeartBeat
                @setPulse "nerfed"

            else if @_heartRate <= CHARACTER.regularHeartBeat
                @setPulse "regular"

        setPulse: (pulse) ->
            if @_pulse isnt pulse
                @_pulse = pulse
                console.debug "Pulse: #{@_pulse}"
                @resetHeartBeat()

        setState: (state) ->
            if @_state isnt state
                @_state = state
                console.debug "State: #{@_state}"

        getImageName: ->
            "#{@_state}_#{@_pulse}"

        update: (deltaTime) ->
            if @isStanding()
                @decreaseHeartBeat deltaTime

            speed = @getSpeed()

            if @isMoving() and speed.x == 0 then @stop()

            if @isJumping() and speed.y >= 0 then @falling()
            else if @isFalling() and speed.y == 0 then @fall()

        move: (direction) ->
            switch @_state
                when "standing"  then @setState "moving"
                when "jumping"   then @setState "movingJumping"
                when "falling"   then @setState "movingFalling"
                when "crouching" then @setState "movingCrouching"
                else return

            @direction = direction
            speedX = CHARACTER["#{@_pulse}MoveSpeed"]
            speedX = -CHARACTER["#{@_pulse}MoveSpeed"] if direction is "left"

            speed = @getSpeed()
            @setSpeed x: speedX, y: speed.y

        stop: ->
            switch @_state
                when "moving"          then @setState "standing"
                when "movingJumping"   then @setState "jumping"
                when "movingFalling"   then @setState "falling"
                when "movingCrouching" then @setState "crouching"
                else return

            speed = @getSpeed()
            @setSpeed x: 0, y: speed.y

        crouch: ->
            if @isHeartNerfed() and not @isInMidAir() and not @isCrouching()
                @setHeight @getHeight() / 2

                if @isMoving()
                    @setState "movingCrouching"
                else
                    @setState "crouching"

        raise: ->
            if @isCrouching()
                @setHeight @getHeight() * 2

                if @isMoving()
                    @setState "moving"
                else
                    @setState "standing"

        jump: ->
            if not @isInMidAir() and not @isCrouching()
                if @isMoving()
                    @setState "movingJumping"
                else
                    @setState "jumping"

                speed = @getSpeed()
                @setSpeed x: speed.x, y: -CHARACTER["#{@_pulse}JumpSpeed"]

        falling: ->
            if not @isFalling()
                if @isMoving()
                    @setState "movingFalling"
                else
                    @setState "falling"

        fall: ->
            switch @_state
                when "falling"       then @setState "standing"
                when "movingFalling" then @setState "moving"
                else return

            speed = @getSpeed()
            @setSpeed x: speed.x, y: 0

        warmLeft: ->
            if @isStanding()
                @setState "warmingLeft"

            else if @_state is "warmingRight"
                @increaseHeartBeat()
                @setState "warmingLeft"

            else
                @unwarm()

        warmRight: ->
            if @isStanding()
                @setState "warmingRight"

            else if @_state is "warmingLeft"
                @increaseHeartBeat()
                @setState "warmingRight"

            else
                @unwarm()

        unwarm: ->
            @resetHeartBeat()
            @setState "standing" if @isWarming()

        isInMidAir: ->
            @isJumping() or @isFalling()

        ##################
        # State checkers #
        ##################

        isStanding: ->
            @_state is "standing"

        isMoving: ->
            @_state in ["moving", "movingJumping", "movingFalling", "movingCrouching"]

        isJumping: ->
            @_state in ["jumping", "movingJumping"]

        isFalling: ->
            @_state in ["falling", "movingFalling"]

        isCrouching: ->
            @_state in ["crouching", "movingCrouching"]

        isWarming: ->
            @_state in ["warmingLeft", "warmingRight"]

        isCaptured: ->
            @_state is "captured"

        ##################
        # Pulse checkers #
        ##################

        isHeartNerfed: ->
            @_pulse is "nerfed"

        isHeartRegular: ->
            @_pulse is "regular"

        isHeartPumped: ->
            @_pulse is "pumped"


    return Character
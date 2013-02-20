define [
    "kinetic"
    "model/constants"
    "model/physics/physicalEntity"
    "model/character/characterStates"
], (Kinetic, Constants, PhysicalEntity, CharacterStates) ->

    {CHARACTER} = Constants

    class Character extends PhysicalEntity

        constructor: ->
            super CHARACTER.width, CHARACTER.height
            @_updateCharacterState pulse: "regular", state: "standing"

        _updateCharacterState: (characterState) ->
            pulse = characterState.pulse ? @_pulse
            state = characterState.state ? @_state

            if pulse isnt @_pulse or state isnt @_state
                @_characterState.stop() if @_characterState?
                @_characterState = new CharacterStates[pulse][state] @

                @_setPulse pulse
                @_setState state

        _setPulse: (pulse) ->
            if @_pulse isnt pulse
                @_pulse = pulse
                @_resetHeartBeat()

                console.debug "Pulse: #{@_pulse}"

        _setState: (state) ->
            if @_state isnt state
                @_state = state

                console.debug "State: #{@_state}"

        getHeartBeat: ->
            @_heartRate

        _resetHeartBeat: ->
            @_heartRate = CHARACTER["#{@_pulse}HeartBeat"]

        _increaseHeartBeat: ->
            @_heartRate += CHARACTER.heartBeatIncrement

            if @_heartRate >= CHARACTER.heartAttackHeartBeat
                @_updateCharacterState pulse: "heartAttack", state: "captured"

            else if @_heartRate >= CHARACTER.pumpedHeartBeat
                @_updateCharacterState pulse: "pumped"

            else if @_heartRate >= CHARACTER.regularHeartBeat
                @_updateCharacterState pulse: "regular"

        _decreaseHeartBeat: (deltaTime) ->
            @_heartRate -= CHARACTER.heatBeatDecerementByTime * deltaTime

            if @_heartRate <= CHARACTER.cardiacArrestHeartBeat
                @_updateCharacterState pulse: "cardiacArrest", state: "captured"

            else if @_heartRate <= CHARACTER.nerfedHeartBeat
                @_updateCharacterState pulse: "nerfed"

            else if @_heartRate <= CHARACTER.regularHeartBeat
                @_updateCharacterState pulse: "regular"

        _createNode: ->
            new Kinetic.Sprite()

        start: ->
            @_characterState.start()

        update: (deltaTime) ->
            return if @isCaptured()

            if @isStanding()
                @_decreaseHeartBeat deltaTime

            speed = @getSpeed()

            if @isMoving() and speed.x == 0 then @stop()

            if speed.y > 0 then @falling()
            else if speed.y == 0 then @fall()

        move: (direction) ->
            return if @isCaptured()

            switch @_state
                when "standing"  then @_updateCharacterState state: "moving"
                when "jumping"   then @_updateCharacterState state: "movingJumping"
                when "falling"   then @_updateCharacterState state: "movingFalling"
                when "crouching" then @_updateCharacterState state: "movingCrouching"
                else return

            @direction = direction
            speedX = CHARACTER["#{@_pulse}MoveSpeed"]
            speedX = -CHARACTER["#{@_pulse}MoveSpeed"] if direction is "left"

            speed = @getSpeed()
            @setSpeed x: speedX, y: speed.y

        stop: ->
            return if @isCaptured()

            switch @_state
                when "moving"          then @_updateCharacterState state: "standing"
                when "movingJumping"   then @_updateCharacterState state: "jumping"
                when "movingFalling"   then @_updateCharacterState state: "falling"
                when "movingCrouching" then @_updateCharacterState state: "crouching"
                else return

            speed = @getSpeed()
            @setSpeed x: 0, y: speed.y

        crouch: ->
            return if @isCaptured()

            if @isHeartNerfed() and not @isInMidAir() and not @isCrouching()
                @setHeight @getHeight() / 2

                if @isMoving()
                    @_updateCharacterState state: "movingCrouching"
                else
                    @_updateCharacterState state: "crouching"

        raise: ->
            return if @isCaptured()

            if @isCrouching()
                @setHeight @getHeight() * 2

                if @isMoving()
                    @_updateCharacterState state: "moving"
                else
                    @_updateCharacterState state: "standing"

        jump: ->
            return if @isCaptured()

            if not @isInMidAir() and not @isCrouching()
                if @isMoving()
                    @_updateCharacterState state: "movingJumping"
                else
                    @_updateCharacterState state: "jumping"

                speed = @getSpeed()
                @setSpeed x: speed.x, y: -CHARACTER["#{@_pulse}JumpSpeed"]

        falling: ->
            return if @isCaptured()

            if not @isFalling()
                if @isMoving()
                    @_updateCharacterState state: "movingFalling"
                else
                    @_updateCharacterState state: "falling"

        fall: ->
            return if @isCaptured()

            if @isFalling()
                switch @_state
                    when "falling"       then @_updateCharacterState state: "standing"
                    when "movingFalling" then @_updateCharacterState state: "moving"
                    else return

                speed = @getSpeed()
                @setSpeed x: speed.x, y: 0

        warmLeft: ->
            return if @isCaptured()

            if @isStanding()
                @_updateCharacterState state: "warmingLeft"

            else if @_state is "warmingRight"
                @_updateCharacterState state: "warmingLeft"
                @_increaseHeartBeat()

            else
                @unwarm()

        warmRight: ->
            return if @isCaptured()

            if @isStanding()
                @_updateCharacterState state: "warmingRight"

            else if @_state is "warmingLeft"
                @_updateCharacterState state: "warmingRight"
                @_increaseHeartBeat()

            else
                @unwarm()

        unwarm: ->
            return if @isCaptured()

            @_resetHeartBeat()
            @_updateCharacterState state: "standing" if @isWarming()

        capture: ->
            return if @isCaptured()

            @_updateCharacterState state: "captured"

        ##################
        # State checkers #
        ##################

        isStanding: ->
            @_characterState.isStanding()

        isMoving: ->
            @_characterState.isMoving()

        isJumping: ->
            @_characterState.isJumping()

        isFalling: ->
            @_characterState.isFalling()

        isInMidAir: ->
            @isJumping() or @isFalling()

        isCrouching: ->
            @_characterState.isCrouching()

        isWarming: ->
            @_characterState.isWarming()

        isCaptured: ->
            @_characterState.isCaptured()

        ##################
        # Pulse checkers #
        ##################

        isHeartNerfed: ->
            @_characterState.isHeartNerfed()

        isHeartRegular: ->
            @_characterState.isHeartRegular()

        isHeartPumped: ->
            @_characterState.isHeartPumped()

        isHeartStopped: ->
            @_characterState.isHeartStopped()


    return Character
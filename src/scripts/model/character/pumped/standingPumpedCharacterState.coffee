define [
    "model/character/characterState"
    "model/character/pumped/jumpingPumpedCharacterState"
    "model/character/pumped/walkingPumpedCharacterState"
    "model/character/pumped/warmingLeftPumpedCharacterState"
    "model/character/pumped/warmingRightPumpedCharacterState"
], (CharacterState, JumpingPumpedCharacterState, WalkingPumpedCharacterState, WarmingLeftPumpedCharacterState, WarmingRightPumpedCharacterState) ->

    class StandingPumpedCharacterState extends CharacterState

        getImageName: ->
            "standingPumpedCharacter"

        move: (character, direction) ->
            character.setState new WalkingPumpedCharacterState direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingPumpedCharacterState

        warmLeft: (character) ->
            character.setState new WarmingLeftPumpedCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightPumpedCharacterState


    return StandingPumpedCharacterState
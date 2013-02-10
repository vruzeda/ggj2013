define [
    "model/character/regular/jumping"
], (Jumping) ->

    class MovingJumping extends Jumping

        isMoving: ->
            true


    return MovingJumping
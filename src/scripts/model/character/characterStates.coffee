dependencies =
    nerfed:
        crouching:       "model/character/nerfed/crouching"
        falling:         "model/character/nerfed/falling"
        jumping:         "model/character/nerfed/jumping"
        moving:          "model/character/nerfed/moving"
        movingCrouching: "model/character/nerfed/movingCrouching"
        movingFalling:   "model/character/nerfed/movingFalling"
        movingJumping:   "model/character/nerfed/movingJumping"
        standing:        "model/character/nerfed/standing"
        warmingLeft:     "model/character/nerfed/warmingLeft"
        warmingRight:    "model/character/nerfed/warmingRight"
        captured:        "model/character/nerfed/captured"

    regular:
        falling:         "model/character/regular/falling"
        jumping:         "model/character/regular/jumping"
        moving:          "model/character/regular/moving"
        movingFalling:   "model/character/regular/movingFalling"
        movingJumping:   "model/character/regular/movingJumping"
        standing:        "model/character/regular/standing"
        warmingLeft:     "model/character/regular/warmingLeft"
        warmingRight:    "model/character/regular/warmingRight"
        captured:        "model/character/regular/captured"

    pumped:
        falling:         "model/character/pumped/falling"
        jumping:         "model/character/pumped/jumping"
        moving:          "model/character/pumped/moving"
        movingFalling:   "model/character/pumped/movingFalling"
        movingJumping:   "model/character/pumped/movingJumping"
        standing:        "model/character/pumped/standing"
        warmingLeft:     "model/character/pumped/warmingLeft"
        warmingRight:    "model/character/pumped/warmingRight"
        captured:        "model/character/pumped/captured"

    cardiacArrest:
        captured:        "model/character/captured/cardiacArrest"

    heartAttack:
        captured:        "model/character/captured/heartAttack"


requires = []
for pulse, states of dependencies
    for state, requirement of states
        requires.push requirement


define requires, (Classes...) ->

    class CharacterStates

        classIndex = 0

        for pulse, states of dependencies
            @[pulse] = {}

            for state of states
                @[pulse][state] = Classes[classIndex]
                classIndex++


    return CharacterStates
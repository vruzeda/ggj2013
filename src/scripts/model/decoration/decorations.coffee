dependencies =
    EndingWindow:   "model/decoration/endingWindow"
    Light:          "model/decoration/light"
    Microscope:     "model/decoration/microscope"
    Scientist:      "model/decoration/scientist"
    ScientistArm:   "model/decoration/scientistArm"
    Support:        "model/decoration/support"
    Tripe:          "model/decoration/tripe"
    TubesStructure: "model/decoration/tubesStructure"


requires = []
for decoration, requirement of dependencies
    requires.push requirement


define requires, (Classes...) ->

    class Decorations

        classIndex = 0

        for decoration of dependencies
            @[decoration] = Classes[classIndex]
            classIndex++


    return Decorations
dependencies =
    Becker:         "model/surface/becker"
    BookPile:       "model/surface/bookPile"
    Books:          "model/surface/books"
    Bureta:         "model/surface/bureta"
    Ceil:           "model/surface/ceil"
    FrascoTripe:    "model/surface/frascoTripe"
    Locker:         "model/surface/locker"
    MediumObstacle: "model/surface/mediumObstacle"
    SupportConico:  "model/surface/supportConico"
    Table:          "model/surface/table"
    Tubes:          "model/surface/tubes"
    WindowBase:     "model/surface/windowBase"


requires = []
for surface, requirement of dependencies
    requires.push requirement


define requires, (Classes...) ->

    class Surfaces

        classIndex = 0

        for surface of dependencies
            @[surface] = Classes[classIndex]
            classIndex++


    return Surfaces
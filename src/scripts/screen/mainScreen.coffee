define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "screen/gameScreen"
    "screen/optionsScreen"
], (Kinetic, Screen, ImageLoader, GameScreen, OptionsScreen) ->

    class MainScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Rect
                width: @getWidth()
                height: @getHeight()
                fill: "black"

            # Buttons
            startGameButton = @_createButton
                id: "startGame"
                x: 100
                y: 100
                image: ImageLoader.getImage "startGameButton"
            @_layer.add startGameButton

            optionsButton = @_createButton
                id: "options"
                x: 100
                y: 200
                image: ImageLoader.getImage "optionsButton"
            @_layer.add optionsButton

            @_selectedButton = startGameButton
            @_selectedButton.get(".highlight")[0].setVisible true

            # Further configurations
            startGameButton.prevButton = optionsButton
            startGameButton.nextButton = optionsButton
            startGameButton.click = @onStartGame

            optionsButton.prevButton = startGameButton
            optionsButton.nextButton = startGameButton
            optionsButton.click = @onOptions

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "DOWN", @onDown
            inputController.addCharListener "UP",   @onUp
            inputController.addCharListener "H",    @onSelect

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "DOWN", @onDown
            inputController.removeCharListener "UP",   @onUp
            inputController.removeCharListener "H",    @onSelect

        onDown: =>
            @_selectedButton.get(".highlight")[0].setVisible false
            @_selectedButton = @_selectedButton.prevButton
            @_selectedButton.get(".highlight")[0].setVisible true
            @redraw()

        onUp: =>
            @_selectedButton.get(".highlight")[0].setVisible false
            @_selectedButton = @_selectedButton.nextButton
            @_selectedButton.get(".highlight")[0].setVisible true
            @redraw()

        onSelect: =>
            @_selectedButton.click?()

        onStartGame: =>
            @_game.showScreen new GameScreen @_game
            @_game.hideScreen @

        onOptions: =>
            @_game.showScreen new OptionsScreen @_game
            @_game.hideScreen @

        _createButton: (options) ->
            image = new Kinetic.Image
                image: options.image ? ""

            buttonGroup = new Kinetic.Group
                id: options.id ? ""
                x: options.x ? 0
                y: options.y ? 0
            buttonGroup.add image
            buttonGroup.add new Kinetic.Rect
                name: "highlight"
                width: image.getWidth()
                height: image.getHeight()
                fill: "rgba(0, 0, 0, 0)"
                stroke: "rgba(255, 255, 255, 128)"
                strokeWidth: 5
                visible: false
            buttonGroup

    return MainScreen
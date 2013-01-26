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

            # Background
            backGroundImage = new Kinetic.Image
                image: ImageLoader.getImage "background"

            @_layer.add backGroundImage

            # Buttons
            startGameButtonImage = ImageLoader.getImage "startGameButton"
            startGameButton = @_createButton
                id: "startGame"
                x: 100
                y: 100
                image: startGameButtonImage
            @_layer.add startGameButton

            optionsButtonImage = ImageLoader.getImage "optionsButton"
            optionsButton = @_createButton
                id: "options"
                x: @getWidth() - optionsButtonImage.width
                y: 0
                image: optionsButtonImage
            @_layer.add optionsButton

            @_selectedButton = startGameButton
            @_selectedButton.get(".highlight")[0].setVisible true

            # Further configurations
            startGameButton.upButton = null
            startGameButton.downButton = null
            startGameButton.leftButton = null
            startGameButton.rightButton = optionsButton
            startGameButton.click = @onStartGame

            optionsButton.upButton = null
            optionsButton.downButton = null
            optionsButton.leftButton = startGameButton
            optionsButton.rightButton = null
            optionsButton.click = @onOptions

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "UP",    @onUp
            inputController.addCharListener "DOWN",  @onDown
            inputController.addCharListener "LEFT",  @onLeft
            inputController.addCharListener "RIGHT", @onRight
            inputController.addCharListener "ENTER", @onSelect
            inputController.addCharListener "H",     @onSelect

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "UP",    @onUp
            inputController.removeCharListener "DOWN",  @onDown
            inputController.removeCharListener "LEFT",  @onLeft
            inputController.removeCharListener "RIGHT", @onRight
            inputController.removeCharListener "ENTER", @onSelect
            inputController.removeCharListener "H",     @onSelect

        onUp: =>
            if @_selectedButton.upButton?
                @_selectedButton.get(".highlight")[0].setVisible false
                @_selectedButton = @_selectedButton.upButton
                @_selectedButton.get(".highlight")[0].setVisible true
                @redraw()

        onDown: =>
            if @_selectedButton.downButton?
                @_selectedButton.get(".highlight")[0].setVisible false
                @_selectedButton = @_selectedButton.downButton
                @_selectedButton.get(".highlight")[0].setVisible true
                @redraw()

        onLeft: =>
            if @_selectedButton.leftButton?
                @_selectedButton.get(".highlight")[0].setVisible false
                @_selectedButton = @_selectedButton.leftButton
                @_selectedButton.get(".highlight")[0].setVisible true
                @redraw()

        onRight: =>
            if @_selectedButton.rightButton?
                @_selectedButton.get(".highlight")[0].setVisible false
                @_selectedButton = @_selectedButton.rightButton
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
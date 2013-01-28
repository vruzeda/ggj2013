(function() {

  define(["kinetic", "framework/imageLoader", "model/constants"], function(Kinetic, ImageLoader, Constants) {
    var CHARACTER, GAME_RESOLUTION, WORLD, WorldRenderer;
    GAME_RESOLUTION = Constants.GAME_RESOLUTION, WORLD = Constants.WORLD, CHARACTER = Constants.CHARACTER;
    WorldRenderer = (function() {

      function WorldRenderer(_layer) {
        this._layer = _layer;
      }

      WorldRenderer.prototype.render = function(world) {
        var character, characterPosition, decoration, decorationPosition, deltaX, frontDecoration, frontDecorationPosition, hud, hudDisplay, hudOpacity, surface, surfacePosition, _i, _j, _k, _len, _len2, _len3, _ref, _ref2, _ref3;
        this._layer.removeChildren();
        this._layer.add(new Kinetic.Image({
          image: ImageLoader.getImage("background")
        }));
        character = world.getCharacter();
        characterPosition = character.getPosition();
        deltaX = ((GAME_RESOLUTION.width - character.getWidth()) / 2) - characterPosition.x;
        if (deltaX > 300) deltaX = 300;
        if (deltaX < -WORLD.endOfGame) deltaX = -WORLD.endOfGame;
        _ref = world.getDecorations();
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          decoration = _ref[_i];
          decorationPosition = decoration.getPosition();
          this._layer.add(new Kinetic.Image({
            image: ImageLoader.getImage(decoration.getImageName()),
            x: decorationPosition.x + deltaX,
            y: decorationPosition.y,
            width: decoration.getWidth(),
            height: decoration.getHeight()
          }));
        }
        _ref2 = world.getSurfaces();
        for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
          surface = _ref2[_j];
          surfacePosition = surface.getPosition();
          this._layer.add(new Kinetic.Image({
            image: ImageLoader.getImage(surface.getImageName()),
            x: surfacePosition.x + deltaX,
            y: surfacePosition.y,
            width: surface.getWidth(),
            height: surface.getHeight()
          }));
        }
        this._layer.add(new Kinetic.Image({
          image: ImageLoader.getImage(character.getImageName()),
          x: characterPosition.x + deltaX,
          y: characterPosition.y,
          width: character.getWidth(),
          height: character.getHeight()
        }));
        _ref3 = world.getFrontDecorations();
        for (_k = 0, _len3 = _ref3.length; _k < _len3; _k++) {
          frontDecoration = _ref3[_k];
          frontDecorationPosition = frontDecoration.getPosition();
          this._layer.add(new Kinetic.Image({
            image: ImageLoader.getImage(frontDecoration.getImageName()),
            x: frontDecorationPosition.x + deltaX,
            y: frontDecorationPosition.y,
            width: frontDecoration.getWidth(),
            height: frontDecoration.getHeight()
          }));
        }
        hudDisplay = new Kinetic.Image({
          image: ImageLoader.getImage("hudDisplay")
        });
        hudOpacity = Math.random();
        if (character.isHeartStoped()) hudOpacity = 0;
        hud = new Kinetic.Group;
        hud.add(new Kinetic.Image({
          image: ImageLoader.getImage("cardiogram1"),
          x: 120,
          y: 22,
          opacity: hudOpacity
        }));
        hud.add(new Kinetic.Image({
          image: ImageLoader.getImage("cardiogram2"),
          x: 120,
          y: 22,
          opacity: 1 - hudOpacity
        }));
        hud.add(hudDisplay);
        hud.add(new Kinetic.Text({
          text: Math.round(character.getHeartBeat()),
          x: -7,
          y: 30,
          width: hudDisplay.getWidth(),
          fontSize: 72,
          fill: "white",
          align: "center"
        }));
        this._layer.add(hud);
        return this._layer.draw();
      };

      return WorldRenderer;

    })();
    return WorldRenderer;
  });

}).call(this);

(function() {

  define(["jquery", "kinetic", "framework/inputController"], function($, Kinetic, InputController) {
    var Game;
    Game = (function() {

      function Game(_containerId, _width, _height) {
        this._containerId = _containerId;
        this._width = _width != null ? _width : 800;
        this._height = _height != null ? _height : 600;
        this._stage = new Kinetic.Stage({
          container: this._containerId,
          width: this._width,
          height: this._height
        });
        this.showScreen(this._getInitialScreen());
      }

      Game.prototype._getInitialScreen = function() {
        throw new Error("Cannot invoke abstract method Game._getInitialScreen().");
      };

      Game.prototype.getInputController = function() {
        return InputController.getInstance(this._containerId);
      };

      Game.prototype.switchScreen = function(oldScreen, newScreen) {
        this.showScreen(newScreen);
        return this.hideScreen(oldScreen);
      };

      Game.prototype.showScreen = function(screen) {
        this._stage.add(screen.getLayer());
        return screen.init();
      };

      Game.prototype.hideScreen = function(screen) {
        return screen.destroy();
      };

      Game.prototype.getWidth = function() {
        return this._width;
      };

      Game.prototype.getHeight = function() {
        return this._height;
      };

      return Game;

    })();
    return Game;
  });

}).call(this);

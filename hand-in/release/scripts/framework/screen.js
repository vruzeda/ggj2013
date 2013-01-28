(function() {

  define(["kinetic"], function(Kinetic) {
    var Screen;
    Screen = (function() {

      function Screen(_game, _width, _height) {
        this._game = _game;
        this._width = _width != null ? _width : this._game.getWidth();
        this._height = _height != null ? _height : this._game.getHeight();
        this._layer = new Kinetic.Layer;
      }

      Screen.prototype.init = function() {
        this._constructLayout();
        this._constructInputEvents(this._game.getInputController());
        return this.redraw();
      };

      Screen.prototype.destroy = function() {
        this._destroyInputEvents(this._game.getInputController());
        return this._layer.remove();
      };

      Screen.prototype._constructLayout = function() {
        throw new Error("Cannot invoke abstract method Screen._constructLayout().");
      };

      Screen.prototype._constructInputEvents = function(inputController) {
        throw new Error("Cannot invoke abstract method Screen._constructInputEvents(inputController).");
      };

      Screen.prototype._destroyInputEvents = function(inputController) {
        throw new Error("Cannot invoke abstract method Screen._destroyInputEvents(inputController).");
      };

      Screen.prototype.redraw = function() {
        return this._layer.draw();
      };

      Screen.prototype.getLayer = function() {
        return this._layer;
      };

      Screen.prototype.getWidth = function() {
        return this._width;
      };

      Screen.prototype.getHeight = function() {
        return this._height;
      };

      return Screen;

    })();
    return Screen;
  });

}).call(this);

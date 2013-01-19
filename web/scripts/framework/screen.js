// Generated by CoffeeScript 1.4.0
(function() {

  define(["kinetic"], function(Kinetic) {
    var Screen;
    Screen = (function() {

      function Screen(_game, _width, _height) {
        this._game = _game;
        this._width = _width != null ? _width : this._game.getWidth();
        this._height = _height != null ? _height : this._game.getHeight();
        this._layer = new Kinetic.Layer;
        this._constructLayout();
      }

      Screen.prototype._constructLayout = function() {
        throw new Error("Cannot invoke abstract method Screen._constructLayout.");
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

      Screen.prototype.registerOnClickListener = function(element, listener) {
        return element.on("click tap", function() {
          return listener(element);
        });
      };

      return Screen;

    })();
    return Screen;
  });

}).call(this);

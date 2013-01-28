(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var Becker;
    Becker = (function(_super) {

      __extends(Becker, _super);

      function Becker() {
        Becker.__super__.constructor.call(this, 205, 180);
      }

      Becker.prototype.getImageName = function() {
        return "becker";
      };

      return Becker;

    })(Surface);
    return Becker;
  });

}).call(this);

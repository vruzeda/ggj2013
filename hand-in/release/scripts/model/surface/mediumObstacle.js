(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var MediumObstacle;
    MediumObstacle = (function(_super) {

      __extends(MediumObstacle, _super);

      function MediumObstacle() {
        MediumObstacle.__super__.constructor.call(this, 205, 180);
      }

      MediumObstacle.prototype.getImageName = function() {
        return "books";
      };

      return MediumObstacle;

    })(Surface);
    return MediumObstacle;
  });

}).call(this);

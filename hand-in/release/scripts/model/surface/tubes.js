(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var Tubes;
    Tubes = (function(_super) {

      __extends(Tubes, _super);

      function Tubes() {
        Tubes.__super__.constructor.call(this, 400, 260);
      }

      Tubes.prototype.getImageName = function() {
        return "tubes";
      };

      return Tubes;

    })(Surface);
    return Tubes;
  });

}).call(this);

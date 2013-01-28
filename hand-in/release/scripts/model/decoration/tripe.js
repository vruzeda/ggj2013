(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var Tripe;
    Tripe = (function(_super) {

      __extends(Tripe, _super);

      function Tripe() {
        Tripe.__super__.constructor.call(this, 369, 180);
      }

      Tripe.prototype.getImageName = function() {
        return "tripe";
      };

      return Tripe;

    })(Decoration);
    return Tripe;
  });

}).call(this);

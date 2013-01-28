(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var Light;
    Light = (function(_super) {

      __extends(Light, _super);

      function Light() {
        Light.__super__.constructor.call(this, 695, 430);
      }

      Light.prototype.getImageName = function() {
        return "light";
      };

      return Light;

    })(Decoration);
    return Light;
  });

}).call(this);

(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var Support;
    Support = (function(_super) {

      __extends(Support, _super);

      function Support() {
        Support.__super__.constructor.call(this, 300, 550);
      }

      Support.prototype.getImageName = function() {
        return "support";
      };

      return Support;

    })(Decoration);
    return Support;
  });

}).call(this);

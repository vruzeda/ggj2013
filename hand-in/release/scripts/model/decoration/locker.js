(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var Locker;
    Locker = (function(_super) {

      __extends(Locker, _super);

      function Locker() {
        Locker.__super__.constructor.call(this, 330, 720);
      }

      Locker.prototype.getImageName = function() {
        return "locker";
      };

      return Locker;

    })(Decoration);
    return Locker;
  });

}).call(this);

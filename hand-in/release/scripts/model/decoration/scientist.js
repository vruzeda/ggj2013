(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var SCIENTIST, Scientist;
    SCIENTIST = Constants.SCIENTIST;
    Scientist = (function(_super) {

      __extends(Scientist, _super);

      function Scientist() {
        Scientist.__super__.constructor.call(this, SCIENTIST.width, SCIENTIST.height);
        this._speed = SCIENTIST.speed;
        this._accumulatedTime = 0;
      }

      Scientist.prototype.getImageName = function() {
        return "scientist";
      };

      Scientist.prototype.update = function(deltaTime) {
        var newPositionX, newPositionY, position;
        this._accumulatedTime += deltaTime;
        position = this.getPosition();
        newPositionX = position.x + this._speed * deltaTime;
        newPositionY = 20 * Math.sin(10 * this._accumulatedTime) - 20;
        this.setPosition({
          x: newPositionX,
          y: newPositionY
        });
        return this._speed = Math.max(SCIENTIST.maxSpeed, this._speed + SCIENTIST.aceleration * deltaTime);
      };

      return Scientist;

    })(Decoration);
    return Scientist;
  });

}).call(this);

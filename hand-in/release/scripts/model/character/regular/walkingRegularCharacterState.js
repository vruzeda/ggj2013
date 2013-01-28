(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/character/characterState", "model/character/regular/movingJumpingRegularCharacterState"], function(Constants, CharacterState, MovingJumpingRegularCharacterState) {
    var JUMP_SPEEDS, SPEEDS, WalkingRegularCharacterState;
    SPEEDS = Constants.SPEEDS, JUMP_SPEEDS = Constants.JUMP_SPEEDS;
    WalkingRegularCharacterState = (function(_super) {

      __extends(WalkingRegularCharacterState, _super);

      function WalkingRegularCharacterState(_direction) {
        this._direction = _direction;
        WalkingRegularCharacterState.__super__.constructor.call(this);
      }

      WalkingRegularCharacterState.prototype.update = function(character, deltaTime) {
        var StandingRegularCharacterState, speed;
        speed = character.getSpeed();
        if (speed.x === 0) {
          StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState");
          return character.setState(new StandingRegularCharacterState);
        }
      };

      WalkingRegularCharacterState.prototype.getImageName = function() {
        return "walkingRegularCharacter";
      };

      WalkingRegularCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      WalkingRegularCharacterState.prototype.stop = function(character) {
        var StandingRegularCharacterState;
        StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState");
        return character.setState(new StandingRegularCharacterState);
      };

      WalkingRegularCharacterState.prototype.crouch = function(character) {};

      WalkingRegularCharacterState.prototype.jump = function(character) {
        var speed;
        speed = character.getSpeed();
        character.setSpeed({
          x: speed.x,
          y: speed.y - JUMP_SPEEDS.regular
        });
        return character.setState(new MovingJumpingRegularCharacterState(this._direction));
      };

      WalkingRegularCharacterState.prototype.warmLeft = function(character) {};

      WalkingRegularCharacterState.prototype.warmRight = function(character) {};

      return WalkingRegularCharacterState;

    })(CharacterState);
    return WalkingRegularCharacterState;
  });

}).call(this);

(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/regular/movingJumpingRegularCharacterState"], function(CharacterState, MovingJumpingRegularCharacterState) {
    var JumpingRegularCharacterState;
    JumpingRegularCharacterState = (function(_super) {

      __extends(JumpingRegularCharacterState, _super);

      function JumpingRegularCharacterState() {
        this._falling = false;
      }

      JumpingRegularCharacterState.prototype.getImageName = function() {
        return "jumpingRegularCharacter";
      };

      JumpingRegularCharacterState.prototype.update = function(character, deltaTime) {
        var StandingRegularCharacterState, speed;
        speed = character.getSpeed();
        if (!this._falling) {
          return this._falling = speed.y >= 0;
        } else if (speed.y === 0) {
          StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState");
          return character.setState(new StandingRegularCharacterState);
        }
      };

      JumpingRegularCharacterState.prototype.move = function(character, direction) {
        var deltaSpeedX, speed;
        deltaSpeedX = direction === "left" ? -SPEEDS.regular : SPEEDS.regular;
        speed = character.getSpeed();
        character.setSpeed({
          x: speed.x + deltaSpeedX,
          y: speed.y
        });
        return character.setState(new MovingJumpingRegularCharacterState(direction));
      };

      JumpingRegularCharacterState.prototype.crouch = function(character) {};

      JumpingRegularCharacterState.prototype.jump = function(character) {};

      JumpingRegularCharacterState.prototype.warmLeft = function(character) {};

      JumpingRegularCharacterState.prototype.warmRight = function(character) {};

      return JumpingRegularCharacterState;

    })(CharacterState);
    return JumpingRegularCharacterState;
  });

}).call(this);

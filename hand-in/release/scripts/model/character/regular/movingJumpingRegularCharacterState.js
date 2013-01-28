(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/character/characterState"], function(Constants, CharacterState) {
    var MovingJumpingRegularCharacterState, SPEEDS;
    SPEEDS = Constants.SPEEDS;
    MovingJumpingRegularCharacterState = (function(_super) {

      __extends(MovingJumpingRegularCharacterState, _super);

      function MovingJumpingRegularCharacterState(_direction) {
        this._direction = _direction;
        MovingJumpingRegularCharacterState.__super__.constructor.call(this);
        this._falling = false;
      }

      MovingJumpingRegularCharacterState.prototype.getImageName = function() {
        return "jumpingRegularCharacter";
      };

      MovingJumpingRegularCharacterState.prototype.update = function(character, deltaTime) {
        var JumpingRegularCharacterState, WalkingRegularCharacterState, deltaX, position, speed;
        position = character.getPosition();
        deltaX = SPEEDS.walking * deltaTime / 1000;
        if (this._direction === "right") {
          character.setPosition({
            x: position.x + deltaX,
            y: position.y
          });
        } else {
          character.setPosition({
            x: position.x - deltaX,
            y: position.y
          });
        }
        speed = character.getSpeed();
        if (speed.x === 0) {
          JumpingRegularCharacterState = require("model/character/regular/jumpingRegularCharacterState");
          return character.setState(new JumpingRegularCharacterState);
        } else if (!this._falling) {
          return this._falling = speed.y >= 0;
        } else if (speed.y === 0) {
          WalkingRegularCharacterState = require("model/character/regular/walkingRegularCharacterState");
          return character.setState(new WalkingRegularCharacterState(this._direction));
        }
      };

      MovingJumpingRegularCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      MovingJumpingRegularCharacterState.prototype.stop = function(character) {
        var JumpingRegularCharacterState;
        JumpingRegularCharacterState = require("model/character/regular/jumpingRegularCharacterState");
        return character.setState(new JumpingRegularCharacterState);
      };

      MovingJumpingRegularCharacterState.prototype.crouch = function(character) {};

      MovingJumpingRegularCharacterState.prototype.jump = function(character) {};

      MovingJumpingRegularCharacterState.prototype.warmLeft = function(character) {};

      MovingJumpingRegularCharacterState.prototype.warmRight = function(character) {};

      return MovingJumpingRegularCharacterState;

    })(CharacterState);
    return MovingJumpingRegularCharacterState;
  });

}).call(this);

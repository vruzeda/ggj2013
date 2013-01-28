(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var MovingJumpingPumpedCharacterState;
    MovingJumpingPumpedCharacterState = (function(_super) {

      __extends(MovingJumpingPumpedCharacterState, _super);

      function MovingJumpingPumpedCharacterState(_direction) {
        this._direction = _direction;
        MovingJumpingPumpedCharacterState.__super__.constructor.call(this);
      }

      MovingJumpingPumpedCharacterState.prototype.getImageName = function() {
        return "jumpingPumpedCharacter";
      };

      MovingJumpingPumpedCharacterState.prototype.update = function(character, deltaTime) {};

      MovingJumpingPumpedCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      MovingJumpingPumpedCharacterState.prototype.stop = function(character) {
        var JumpingPumpedCharacterState;
        JumpingPumpedCharacterState = require("model/character/pumped/jumpingPumpedCharacterState");
        return character.setState(new JumpingPumpedCharacterState);
      };

      MovingJumpingPumpedCharacterState.prototype.crouch = function(character) {};

      MovingJumpingPumpedCharacterState.prototype.jump = function(character) {};

      MovingJumpingPumpedCharacterState.prototype.warmLeft = function(character) {};

      MovingJumpingPumpedCharacterState.prototype.warmRight = function(character) {};

      return MovingJumpingPumpedCharacterState;

    })(CharacterState);
    return MovingJumpingPumpedCharacterState;
  });

}).call(this);

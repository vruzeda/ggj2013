(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var MovingCrouchingNerfedCharacterState;
    MovingCrouchingNerfedCharacterState = (function(_super) {

      __extends(MovingCrouchingNerfedCharacterState, _super);

      function MovingCrouchingNerfedCharacterState(_direction) {
        this._direction = _direction;
        MovingCrouchingNerfedCharacterState.__super__.constructor.call(this);
      }

      MovingCrouchingNerfedCharacterState.prototype.getImageName = function() {
        return "crouchingNerfedCharacter";
      };

      MovingCrouchingNerfedCharacterState.prototype.update = function(character, deltaTime) {};

      MovingCrouchingNerfedCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      MovingCrouchingNerfedCharacterState.prototype.stop = function(character) {
        var CrouchingNerfedCharacterState;
        CrouchingNerfedCharacterState = require("model/character/nerfed/crouchingNerfedCharacterState");
        return character.setState(new CrouchingNerfedCharacterState);
      };

      MovingCrouchingNerfedCharacterState.prototype.crouch = function(character) {};

      MovingCrouchingNerfedCharacterState.prototype.jump = function(character) {};

      MovingCrouchingNerfedCharacterState.prototype.warmLeft = function(character) {};

      MovingCrouchingNerfedCharacterState.prototype.warmRight = function(character) {};

      return MovingCrouchingNerfedCharacterState;

    })(CharacterState);
    return MovingCrouchingNerfedCharacterState;
  });

}).call(this);

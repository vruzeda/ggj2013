(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/nerfed/crouchingNerfedCharacterState"], function(CharacterState, crouchingNerfedCharacterState) {
    var WalkingNerfedCharacterState;
    WalkingNerfedCharacterState = (function(_super) {

      __extends(WalkingNerfedCharacterState, _super);

      function WalkingNerfedCharacterState(_direction) {
        this._direction = _direction;
        WalkingNerfedCharacterState.__super__.constructor.call(this);
      }

      WalkingNerfedCharacterState.prototype.update = function(character, deltaTime) {};

      WalkingNerfedCharacterState.prototype.getImageName = function() {
        return "walkingNerfedCharacterState";
      };

      WalkingNerfedCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      WalkingNerfedCharacterState.prototype.stop = function(character) {
        var StandingNerfedCharacterState;
        StandingNerfedCharacterState = require("model/character/nerfed/standingNerfedCharacterState");
        return character.setState(new StandingNerfedCharacterState);
      };

      WalkingNerfedCharacterState.prototype.crouch = function(character) {
        return character.setState(new CrouchingNerfedCharacterState);
      };

      WalkingNerfedCharacterState.prototype.jump = function(character) {};

      WalkingNerfedCharacterState.prototype.warmLeft = function(character) {};

      WalkingNerfedCharacterState.prototype.warmRight = function(character) {};

      return WalkingNerfedCharacterState;

    })(CharacterState);
    return WalkingNerfedCharacterState;
  });

}).call(this);

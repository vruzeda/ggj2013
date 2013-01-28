(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/nerfed/movingCrouchingNerfedCharacterState"], function(CharacterState) {
    var CrouchingNerfedCharacterState;
    CrouchingNerfedCharacterState = (function(_super) {

      __extends(CrouchingNerfedCharacterState, _super);

      function CrouchingNerfedCharacterState() {
        CrouchingNerfedCharacterState.__super__.constructor.apply(this, arguments);
      }

      CrouchingNerfedCharacterState.prototype.getImageName = function() {
        return "crouchingNerfedCharacter";
      };

      CrouchingNerfedCharacterState.prototype.update = function(character, deltaTime) {};

      CrouchingNerfedCharacterState.prototype.move = function(character, direction) {
        return character.setState(new MovingCrouchingNerfedCharacterState(this._direction));
      };

      CrouchingNerfedCharacterState.prototype.crouch = function(character) {};

      CrouchingNerfedCharacterState.prototype.jump = function(character) {};

      CrouchingNerfedCharacterState.prototype.warmLeft = function(character) {};

      CrouchingNerfedCharacterState.prototype.warmRight = function(character) {};

      return CrouchingNerfedCharacterState;

    })(CharacterState);
    return CrouchingNerfedCharacterState;
  });

}).call(this);

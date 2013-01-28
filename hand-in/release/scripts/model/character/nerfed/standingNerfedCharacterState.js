(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/nerfed/crouchingNerfedCharacterState", "model/character/nerfed/walkingNerfedCharacterState", "model/character/nerfed/warmingLeftNerfedCharacterState", "model/character/nerfed/warmingRightNerfedCharacterState"], function(CharacterState, CrouchingNerfedCharacterState, WalkingNerfedCharacterState, WarmingLeftNerfedCharacterState, WarmingRightNerfedCharacterState) {
    var StandingNerfedCharacterState;
    StandingNerfedCharacterState = (function(_super) {

      __extends(StandingNerfedCharacterState, _super);

      function StandingNerfedCharacterState() {
        StandingNerfedCharacterState.__super__.constructor.apply(this, arguments);
      }

      StandingNerfedCharacterState.prototype.getImageName = function() {
        return "standingNerfedCharacterState";
      };

      StandingNerfedCharacterState.prototype.update = function(character, deltaTime) {
        return character.decreaseHeartBeat(character, deltaTime);
      };

      StandingNerfedCharacterState.prototype.move = function(character, direction) {
        return character.setState(new WalkingNerfedCharacterState(direction));
      };

      StandingNerfedCharacterState.prototype.crouch = function(character) {
        return character.setState(new CrouchingNerfedCharacterState);
      };

      StandingNerfedCharacterState.prototype.jump = function(character) {};

      StandingNerfedCharacterState.prototype.warmLeft = function(character) {
        return character.setState(new WarmingLeftNerfedCharacterState);
      };

      StandingNerfedCharacterState.prototype.warmRight = function(character) {
        return character.setState(new WarmingRightNerfedCharacterState);
      };

      return StandingNerfedCharacterState;

    })(CharacterState);
    return StandingNerfedCharacterState;
  });

}).call(this);

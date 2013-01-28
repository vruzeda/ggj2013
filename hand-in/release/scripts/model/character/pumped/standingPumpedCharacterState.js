(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/pumped/jumpingPumpedCharacterState", "model/character/pumped/walkingPumpedCharacterState", "model/character/pumped/warmingLeftPumpedCharacterState", "model/character/pumped/warmingRightPumpedCharacterState"], function(CharacterState, JumpingPumpedCharacterState, WalkingPumpedCharacterState, WarmingLeftPumpedCharacterState, WarmingRightPumpedCharacterState) {
    var StandingPumpedCharacterState;
    StandingPumpedCharacterState = (function(_super) {

      __extends(StandingPumpedCharacterState, _super);

      function StandingPumpedCharacterState() {
        StandingPumpedCharacterState.__super__.constructor.apply(this, arguments);
      }

      StandingPumpedCharacterState.prototype.getImageName = function() {
        return "standingPumpedCharacter";
      };

      StandingPumpedCharacterState.prototype.update = function(character, deltaTime) {
        return character.decreaseHeartBeat(character, deltaTime);
      };

      StandingPumpedCharacterState.prototype.move = function(character, direction) {
        return character.setState(new WalkingPumpedCharacterState(direction));
      };

      StandingPumpedCharacterState.prototype.crouch = function(character) {};

      StandingPumpedCharacterState.prototype.jump = function(character) {
        return character.setState(new JumpingPumpedCharacterState);
      };

      StandingPumpedCharacterState.prototype.warmLeft = function(character) {
        return character.setState(new WarmingLeftPumpedCharacterState);
      };

      StandingPumpedCharacterState.prototype.warmRight = function(character) {
        return character.setState(new WarmingRightPumpedCharacterState);
      };

      return StandingPumpedCharacterState;

    })(CharacterState);
    return StandingPumpedCharacterState;
  });

}).call(this);

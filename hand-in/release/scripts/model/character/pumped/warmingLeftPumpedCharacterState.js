(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingLeftPumpedCharacterState;
    WarmingLeftPumpedCharacterState = (function(_super) {

      __extends(WarmingLeftPumpedCharacterState, _super);

      function WarmingLeftPumpedCharacterState() {
        WarmingLeftPumpedCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingLeftPumpedCharacterState.prototype.getImageName = function() {
        return "warmingLeftPumpedCharacter";
      };

      WarmingLeftPumpedCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingLeftPumpedCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftPumpedCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftPumpedCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftPumpedCharacterState.prototype.warmLeft = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftPumpedCharacterState.prototype.warmRight = function(character) {
        var WarmingRightPumpedCharacterState;
        character.increaseHeartBeat();
        WarmingRightPumpedCharacterState = require("model/character/pumped/warmingRightPumpedCharacterState");
        return character.setState(new WarmingRightPumpedCharacterState);
      };

      WarmingLeftPumpedCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingPumpedCharacterState;
        StandingPumpedCharacterState = require("model/character/pumped/standingPumpedCharacterState");
        return character.setState(new StandingPumpedCharacterState);
      };

      return WarmingLeftPumpedCharacterState;

    })(CharacterState);
    return WarmingLeftPumpedCharacterState;
  });

}).call(this);

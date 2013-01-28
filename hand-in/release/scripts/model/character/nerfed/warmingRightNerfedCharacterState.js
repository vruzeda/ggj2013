(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingRightNerfedCharacterState;
    WarmingRightNerfedCharacterState = (function(_super) {

      __extends(WarmingRightNerfedCharacterState, _super);

      function WarmingRightNerfedCharacterState() {
        WarmingRightNerfedCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingRightNerfedCharacterState.prototype.getImageName = function() {
        return "warmingRightNerfedCharacter";
      };

      WarmingRightNerfedCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingRightNerfedCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingRightNerfedCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightNerfedCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightNerfedCharacterState.prototype.warmLeft = function(character) {
        var WarmingLeftNerfedCharacterState;
        character.increaseHeartBeat();
        WarmingLeftNerfedCharacterState = require("model/character/nerfed/warmingLeftNerfedCharacterState");
        return character.setState(new WarmingLeftNerfedCharacterState);
      };

      WarmingRightNerfedCharacterState.prototype.warmRight = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightNerfedCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingNerfedCharacterState;
        StandingNerfedCharacterState = require("model/character/nerfed/standingNerfedCharacterState");
        return character.setState(new StandingNerfedCharacterState);
      };

      return WarmingRightNerfedCharacterState;

    })(CharacterState);
    return WarmingRightNerfedCharacterState;
  });

}).call(this);

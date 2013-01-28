(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingRightRegularCharacterState;
    WarmingRightRegularCharacterState = (function(_super) {

      __extends(WarmingRightRegularCharacterState, _super);

      function WarmingRightRegularCharacterState() {
        WarmingRightRegularCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingRightRegularCharacterState.prototype.getImageName = function() {
        return "warmingRightRegularCharacter";
      };

      WarmingRightRegularCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingRightRegularCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingRightRegularCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightRegularCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightRegularCharacterState.prototype.warmLeft = function(character) {
        var WarmingLeftRegularCharacterState;
        character.increaseHeartBeat();
        WarmingLeftRegularCharacterState = require("model/character/regular/warmingLeftRegularCharacterState");
        return character.setState(new WarmingLeftRegularCharacterState);
      };

      WarmingRightRegularCharacterState.prototype.warmRight = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightRegularCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingRegularCharacterState;
        StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState");
        return character.setState(new StandingRegularCharacterState);
      };

      return WarmingRightRegularCharacterState;

    })(CharacterState);
    return WarmingRightRegularCharacterState;
  });

}).call(this);

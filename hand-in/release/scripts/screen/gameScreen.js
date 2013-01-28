(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["kinetic", "framework/screen", "model/constants", "model/world", "renderer/worldRenderer"], function(Kinetic, Screen, Constants, World, WorldRenderer) {
    var GameScreen, WORLD;
    WORLD = Constants.WORLD;
    GameScreen = (function(_super) {

      __extends(GameScreen, _super);

      function GameScreen() {
        this.onWarmRight = __bind(this.onWarmRight, this);
        this.onWarmLeft = __bind(this.onWarmLeft, this);
        this.onJump = __bind(this.onJump, this);
        this.onCrouch = __bind(this.onCrouch, this);
        this.onMoveRight = __bind(this.onMoveRight, this);
        this.onMoveLeft = __bind(this.onMoveLeft, this);
        GameScreen.__super__.constructor.apply(this, arguments);
      }

      GameScreen.prototype._constructLayout = function() {
        var _this = this;
        this._world = new World(WORLD.gravity, WORLD.width, WORLD.height);
        this._character = this._world.getCharacter();
        this._worldRenderer = new WorldRenderer(this._layer);
        this._acumulatedTime = 0;
        this._updater = new Kinetic.Animation(function(parameters) {
          _this._acumulatedTime += parameters.timeDiff;
          if (_this._acumulatedTime > 30) {
            _this._world.update(30);
            _this._worldRenderer.render(_this._world);
            return _this._acumulatedTime -= 30;
          }
        });
        this._updater.start();
        this._onMovementRight = false;
        this._onMovementLeft = false;
        this._onWarmRight = false;
        return this._onWarmLeft = false;
      };

      GameScreen.prototype._constructInputEvents = function(inputController) {
        inputController.addCharListener("UP", this.onJump);
        inputController.addCharListener("DOWN", this.onCrouch);
        inputController.addCharListener("LEFT", this.onMoveLeft);
        inputController.addCharListener("RIGHT", this.onMoveRight);
        inputController.addCharListener("A", this.onCrouch);
        inputController.addCharListener("S", this.onJump);
        inputController.addCharListener("D", this.onWarmLeft);
        return inputController.addCharListener("F", this.onWarmRight);
      };

      GameScreen.prototype._destroyInputEvents = function(inputController) {
        inputController.removeCharListener("UP", this.onJump);
        inputController.removeCharListener("DOWN", this.onCrouch);
        inputController.removeCharListener("LEFT", this.onMoveLeft);
        inputController.removeCharListener("RIGHT", this.onMoveRight);
        inputController.removeCharListener("A", this.onCrouch);
        inputController.removeCharListener("S", this.onJump);
        inputController.removeCharListener("D", this.onWarmLeft);
        return inputController.removeCharListener("F", this.onWarmRight);
      };

      GameScreen.prototype.onMoveLeft = function(event) {
        if (event.type === 'keyup') {
          this._onMovementLeft = false;
          if (!this._onMovementRight) return this._character.stop();
        } else {
          this._onMovementLeft = true;
          return this._character.move("left");
        }
      };

      GameScreen.prototype.onMoveRight = function(event) {
        if (event.type === 'keyup') {
          this._onMovementRight = false;
          if (!this._onMovementLeft) return this._character.stop();
        } else {
          this._onMovementRight = true;
          return this._character.move("right");
        }
      };

      GameScreen.prototype.onCrouch = function(event) {
        if (event.type === 'keyup') {
          return this._world.raiseCharacter();
        } else {
          return this._world.crouchCharacter();
        }
      };

      GameScreen.prototype.onJump = function(event) {
        if (event.type === 'keyup') {
          return this._character.stop();
        } else {
          return this._character.jump();
        }
      };

      GameScreen.prototype.onWarmLeft = function(event) {
        if (event.type === 'keyup') {
          this._onWarmLeft = false;
          if (!this._onWarmRight) return this._character.unwarm();
        } else if (!this._onWarmLeft) {
          this._onWarmLeft = true;
          return this._character.warmLeft();
        }
      };

      GameScreen.prototype.onWarmRight = function(event) {
        if (event.type === 'keyup') {
          this._onWarmRight = false;
          if (!this._onWarmLeft) return this._character.unwarm();
        } else if (!this._onWarmRight) {
          this._onWarmRight = true;
          return this._character.warmRight();
        }
      };

      return GameScreen;

    })(Screen);
    return GameScreen;
  });

}).call(this);

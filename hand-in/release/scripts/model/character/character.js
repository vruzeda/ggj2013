(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/physics/physicalEntity"], function(Constants, PhysicalEntity) {
    var CHARACTER, Character;
    CHARACTER = Constants.CHARACTER;
    Character = (function(_super) {

      __extends(Character, _super);

      function Character() {
        Character.__super__.constructor.call(this, CHARACTER.width, CHARACTER.height);
        this.setState("standing");
        this.setPulse("regular");
      }

      Character.prototype.getHeartBeat = function() {
        return this._heartRate;
      };

      Character.prototype.resetHeartBeat = function() {
        return this._heartRate = CHARACTER["" + this._pulse + "HeartBeat"];
      };

      Character.prototype.increaseHeartBeat = function() {
        this._heartRate += CHARACTER.heartBeatIncrement;
        if (this._heartRate >= CHARACTER.heartAttackHeartBeat) {
          this.setState("captured");
          return this.setPulse("heartAttack");
        } else if (this._heartRate >= CHARACTER.pumpedHeartBeat) {
          return this.setPulse("pumped");
        } else if (this._heartRate >= CHARACTER.regularHeartBeat) {
          return this.setPulse("regular");
        }
      };

      Character.prototype.decreaseHeartBeat = function(deltaTime) {
        this._heartRate -= CHARACTER.heatBeatDecerementByTime * deltaTime;
        if (this._heartRate <= CHARACTER.cardiacArrestHeartBeat) {
          this.setState("captured");
          return this.setPulse("cardiacArrest");
        } else if (this._heartRate <= CHARACTER.nerfedHeartBeat) {
          return this.setPulse("nerfed");
        } else if (this._heartRate <= CHARACTER.regularHeartBeat) {
          return this.setPulse("regular");
        }
      };

      Character.prototype.setPulse = function(pulse) {
        if (this._pulse !== pulse) {
          this._pulse = pulse;
          console.debug("Pulse: " + this._pulse);
          return this.resetHeartBeat();
        }
      };

      Character.prototype.setState = function(state) {
        if (this._state !== state) {
          this._state = state;
          return console.debug("State: " + this._state);
        }
      };

      Character.prototype.getImageName = function() {
        return "" + this._state + "_" + this._pulse;
      };

      Character.prototype.update = function(deltaTime) {
        var speed;
        if (this.isHeartStoped()) return;
        if (this.isStanding()) this.decreaseHeartBeat(deltaTime);
        speed = this.getSpeed();
        if (this.isMoving() && speed.x === 0) this.stop();
        if (this.isJumping() && speed.y >= 0) {
          return this.falling();
        } else if (this.isFalling() && speed.y === 0) {
          return this.fall();
        }
      };

      Character.prototype.move = function(direction) {
        var speed, speedX;
        if (this.isHeartStoped()) return;
        switch (this._state) {
          case "standing":
            this.setState("moving");
            break;
          case "jumping":
            this.setState("movingJumping");
            break;
          case "falling":
            this.setState("movingFalling");
            break;
          case "crouching":
            this.setState("movingCrouching");
            break;
          default:
            return;
        }
        this.direction = direction;
        speedX = CHARACTER["" + this._pulse + "MoveSpeed"];
        if (direction === "left") {
          speedX = -CHARACTER["" + this._pulse + "MoveSpeed"];
        }
        speed = this.getSpeed();
        return this.setSpeed({
          x: speedX,
          y: speed.y
        });
      };

      Character.prototype.stop = function() {
        var speed;
        if (this.isHeartStoped()) return;
        switch (this._state) {
          case "moving":
            this.setState("standing");
            break;
          case "movingJumping":
            this.setState("jumping");
            break;
          case "movingFalling":
            this.setState("falling");
            break;
          case "movingCrouching":
            this.setState("crouching");
            break;
          default:
            return;
        }
        speed = this.getSpeed();
        return this.setSpeed({
          x: 0,
          y: speed.y
        });
      };

      Character.prototype.crouch = function() {
        if (this.isHeartStoped()) return;
        if (this.isHeartNerfed() && !this.isInMidAir() && !this.isCrouching()) {
          this.setHeight(this.getHeight() / 2);
          if (this.isMoving()) {
            return this.setState("movingCrouching");
          } else {
            return this.setState("crouching");
          }
        }
      };

      Character.prototype.raise = function() {
        if (this.isHeartStoped()) return;
        if (this.isCrouching()) {
          this.setHeight(this.getHeight() * 2);
          if (this.isMoving()) {
            return this.setState("moving");
          } else {
            return this.setState("standing");
          }
        }
      };

      Character.prototype.jump = function() {
        var speed;
        if (this.isHeartStoped()) return;
        if (!this.isInMidAir() && !this.isCrouching()) {
          if (this.isMoving()) {
            this.setState("movingJumping");
          } else {
            this.setState("jumping");
          }
          speed = this.getSpeed();
          return this.setSpeed({
            x: speed.x,
            y: -CHARACTER["" + this._pulse + "JumpSpeed"]
          });
        }
      };

      Character.prototype.falling = function() {
        if (this.isHeartStoped()) return;
        if (!this.isFalling()) {
          if (this.isMoving()) {
            return this.setState("movingFalling");
          } else {
            return this.setState("falling");
          }
        }
      };

      Character.prototype.fall = function() {
        var speed;
        if (this.isHeartStoped()) return;
        switch (this._state) {
          case "falling":
            this.setState("standing");
            break;
          case "movingFalling":
            this.setState("moving");
            break;
          default:
            return;
        }
        speed = this.getSpeed();
        return this.setSpeed({
          x: speed.x,
          y: 0
        });
      };

      Character.prototype.warmLeft = function() {
        if (this.isHeartStoped()) return;
        if (this.isStanding()) {
          return this.setState("warmingLeft");
        } else if (this._state === "warmingRight") {
          this.setState("warmingLeft");
          return this.increaseHeartBeat();
        } else {
          return this.unwarm();
        }
      };

      Character.prototype.warmRight = function() {
        if (this.isHeartStoped()) return;
        if (this.isStanding()) {
          return this.setState("warmingRight");
        } else if (this._state === "warmingLeft") {
          this.setState("warmingRight");
          return this.increaseHeartBeat();
        } else {
          return this.unwarm();
        }
      };

      Character.prototype.unwarm = function() {
        if (this.isHeartStoped()) return;
        this.resetHeartBeat();
        if (this.isWarming()) return this.setState("standing");
      };

      Character.prototype.isInMidAir = function() {
        return this.isJumping() || this.isFalling();
      };

      Character.prototype.isStanding = function() {
        return this._state === "standing";
      };

      Character.prototype.isMoving = function() {
        var _ref;
        return (_ref = this._state) === "moving" || _ref === "movingJumping" || _ref === "movingFalling" || _ref === "movingCrouching";
      };

      Character.prototype.isJumping = function() {
        var _ref;
        return (_ref = this._state) === "jumping" || _ref === "movingJumping";
      };

      Character.prototype.isFalling = function() {
        var _ref;
        return (_ref = this._state) === "falling" || _ref === "movingFalling";
      };

      Character.prototype.isCrouching = function() {
        var _ref;
        return (_ref = this._state) === "crouching" || _ref === "movingCrouching";
      };

      Character.prototype.isWarming = function() {
        var _ref;
        return (_ref = this._state) === "warmingLeft" || _ref === "warmingRight";
      };

      Character.prototype.isCaptured = function() {
        return this._state === "captured";
      };

      Character.prototype.isHeartNerfed = function() {
        return this._pulse === "nerfed";
      };

      Character.prototype.isHeartRegular = function() {
        return this._pulse === "regular";
      };

      Character.prototype.isHeartPumped = function() {
        return this._pulse === "pumped";
      };

      Character.prototype.isHeartStoped = function() {
        return this._pulse === "cardiacArrest" || this._pulse === "heartAttack";
      };

      return Character;

    })(PhysicalEntity);
    return Character;
  });

}).call(this);

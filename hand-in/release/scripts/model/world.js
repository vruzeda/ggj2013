(function() {

  define(["model/constants", "model/character/character", "model/surface/table", "model/surface/ceil", "model/surface/mediumObstacle", "model/surface/becker", "model/surface/books", "model/surface/bookPile", "model/surface/bureta", "model/surface/tubes", "model/surface/frascoTripe", "model/surface/windowBase", "model/decoration/microscope", "model/decoration/scientist", "model/decoration/tubesStructure", "model/decoration/tripe", "model/decoration/support", "model/decoration/locker", "model/decoration/endingWindow", "model/decoration/light"], function(Constants, Character, Table, Ceil, MediumObstacle, Becker, Books, BookPile, Bureta, Tubes, FrascoTripe, WindowBase, Microscope, Scientist, TubesStructure, Tripe, Support, Locker, EndingWindow, Light) {
    var CEIL, CHARACTER, GAME, GAME_RESOLUTION, SCIENTIST, TABLE, WORLD, World;
    CHARACTER = Constants.CHARACTER, TABLE = Constants.TABLE, CEIL = Constants.CEIL, SCIENTIST = Constants.SCIENTIST, GAME = Constants.GAME, WORLD = Constants.WORLD, GAME_RESOLUTION = Constants.GAME_RESOLUTION;
    World = (function() {

      function World(_gravity, _width, _height) {
        var becker, becker2, becker3, becker4, becker5, becker6, bookPile, bookPile2, books, books3, books6, bureta, bureta2, bureta3, ceil, endingWindow, frascoTripe, frascoTripe2, i, lastPosition, light, locker, microscope, support, support2, table, tripe, tripe2, tubeStructure, tubeStructure2, tubes, tubes2, windowBase;
        this._gravity = _gravity;
        this._width = _width;
        this._height = _height;
        this._character = new Character;
        this._character.setPosition({
          x: CHARACTER.x,
          y: CHARACTER.y
        });
        this._surfaces = [];
        this._decorations = [];
        this._frontDecorations = [];
        for (i = 0; i <= 6; i++) {
          table = new Table;
          table.setPosition({
            x: TABLE.x + i * TABLE.width,
            y: TABLE.y
          });
          this._surfaces.push(table);
          ceil = new Ceil;
          ceil.setPosition({
            x: TABLE.x + i * CEIL.width,
            y: CEIL.y
          });
          this._surfaces.push(ceil);
        }
        this._scientist = new Scientist;
        this._scientist.setPosition({
          x: SCIENTIST.x,
          y: SCIENTIST.y
        });
        this._decorations.push(this._scientist);
        locker = new Locker;
        locker.setPosition({
          x: -330,
          y: 0
        });
        this._surfaces.push(locker);
        endingWindow = new EndingWindow;
        endingWindow.setPosition({
          x: WORLD.endOfGame + 880,
          y: 0
        });
        this._decorations.push(endingWindow);
        windowBase = new WindowBase;
        windowBase.setPosition({
          x: WORLD.endOfGame + 1210,
          y: 330
        });
        this._surfaces.push(windowBase);
        light = new Light;
        light.setPosition({
          x: WORLD.endOfGame + 625,
          y: 40
        });
        this._frontDecorations.push(light);
        becker = new Becker;
        becker.setPosition({
          x: 600,
          y: TABLE.y - 180
        });
        this._surfaces.push(becker);
        lastPosition = 600;
        books = new Books;
        books.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 180
        });
        this._surfaces.push(books);
        lastPosition += 600;
        bookPile = new BookPile;
        bookPile.setPosition({
          x: lastPosition + 1150,
          y: TABLE.y - 360
        });
        this._surfaces.push(bookPile);
        lastPosition += 1150;
        books3 = new Books;
        books3.setPosition({
          x: lastPosition + 1230,
          y: TABLE.y - 180
        });
        this._surfaces.push(books3);
        lastPosition += 1230;
        tripe = new Tripe;
        tripe.setPosition({
          x: lastPosition + 1180,
          y: TABLE.y - 180
        });
        this._frontDecorations.push(tripe);
        frascoTripe = new FrascoTripe;
        frascoTripe.setPosition({
          x: lastPosition + 1200,
          y: TABLE.y - 620
        });
        this._surfaces.push(frascoTripe);
        lastPosition += 1200;
        bureta = new Bureta;
        bureta.setPosition({
          x: lastPosition + 1000,
          y: TABLE.y - 360
        });
        this._surfaces.push(bureta);
        lastPosition += 1000;
        bureta2 = new Bureta;
        bureta2.setPosition({
          x: lastPosition + 1000,
          y: TABLE.y - 360
        });
        this._surfaces.push(bureta2);
        lastPosition += 1000;
        support = new Support;
        support.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 550
        });
        this._decorations.push(support);
        becker2 = new Becker;
        becker2.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 310
        });
        this._surfaces.push(becker2);
        lastPosition += 600;
        becker3 = new Becker;
        becker3.setPosition({
          x: lastPosition,
          y: TABLE.y - 485
        });
        this._surfaces.push(becker3);
        books6 = new Books;
        books6.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 180
        });
        this._surfaces.push(books6);
        lastPosition += 600;
        tubeStructure = new TubesStructure;
        tubeStructure.setPosition({
          x: lastPosition + 900,
          y: TABLE.y - 360
        });
        this._decorations.push(tubeStructure);
        tubes = new Tubes;
        tubes.setPosition({
          x: lastPosition + 900,
          y: TABLE.y - 370
        });
        this._surfaces.push(tubes);
        lastPosition += 900;
        becker4 = new Becker;
        becker4.setPosition({
          x: lastPosition + 800,
          y: TABLE.y - 180
        });
        this._surfaces.push(becker4);
        lastPosition += 800;
        support2 = new Support;
        support2.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 550
        });
        this._decorations.push(support2);
        becker5 = new Becker;
        becker5.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 310
        });
        this._surfaces.push(becker5);
        lastPosition += 600;
        becker6 = new Becker;
        becker6.setPosition({
          x: lastPosition,
          y: TABLE.y - 485
        });
        this._surfaces.push(becker6);
        bookPile2 = new BookPile;
        bookPile2.setPosition({
          x: lastPosition + 1150,
          y: TABLE.y - 360
        });
        this._surfaces.push(bookPile2);
        lastPosition += 1150;
        bureta3 = new Bureta;
        bureta3.setPosition({
          x: lastPosition + 800,
          y: TABLE.y - 360
        });
        this._surfaces.push(bureta3);
        lastPosition += 700;
        tripe2 = new Tripe;
        tripe2.setPosition({
          x: lastPosition + 580,
          y: TABLE.y - 180
        });
        this._frontDecorations.push(tripe2);
        frascoTripe2 = new FrascoTripe;
        frascoTripe2.setPosition({
          x: lastPosition + 600,
          y: TABLE.y - 620
        });
        this._surfaces.push(frascoTripe2);
        lastPosition += 600;
        tubeStructure2 = new TubesStructure;
        tubeStructure2.setPosition({
          x: lastPosition + 900,
          y: TABLE.y - 360
        });
        this._decorations.push(tubeStructure2);
        tubes2 = new Tubes;
        tubes2.setPosition({
          x: lastPosition + 900,
          y: TABLE.y - 360
        });
        this._surfaces.push(tubes2);
        lastPosition += 900;
        microscope = new Microscope;
        microscope.setPosition({
          x: 100,
          y: TABLE.y - 540
        });
        this._decorations.push(microscope);
      }

      World.prototype.update = function(deltaTime) {
        var charPos, delta, deltaTimeInSeconds, newDelta, scientistPos, speed, surface, _i, _j, _k, _l, _len, _len2, _len3, _len4, _ref, _ref2, _ref3, _ref4;
        deltaTimeInSeconds = deltaTime / 1000;
        speed = this._character.getSpeed();
        speed.y += this._gravity * deltaTimeInSeconds;
        delta = {
          x: speed.x * deltaTimeInSeconds,
          y: speed.y * deltaTimeInSeconds
        };
        newDelta = {
          x: delta.x,
          y: delta.y
        };
        if (this._character.direction === "left") {
          _ref = this._surfaces;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            surface = _ref[_i];
            newDelta.x = this._character.collidesLeftWith(surface, delta.x);
            if (newDelta.x !== delta.x) {
              this._character.stop();
              break;
            }
          }
        } else if (this._character.direction === "right") {
          _ref2 = this._surfaces;
          for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
            surface = _ref2[_j];
            newDelta.x = this._character.collidesRightWith(surface, delta.x);
            if (newDelta.x !== delta.x) {
              this._character.stop();
              break;
            }
          }
        }
        if (this._character.isJumping()) {
          _ref3 = this._surfaces;
          for (_k = 0, _len3 = _ref3.length; _k < _len3; _k++) {
            surface = _ref3[_k];
            newDelta.y = this._character.collidesTopWith(surface, delta.y);
            if (newDelta.y !== delta.y) {
              speed.y = 0;
              break;
            }
          }
        } else {
          _ref4 = this._surfaces;
          for (_l = 0, _len4 = _ref4.length; _l < _len4; _l++) {
            surface = _ref4[_l];
            newDelta.y = this._character.collidesBottomWith(surface, delta.y);
            if (newDelta.y !== delta.y) {
              speed.y = 0;
              break;
            }
          }
        }
        this._character.moveBy(newDelta);
        this._character.setSpeed(speed);
        this._character.update(deltaTime);
        this._scientist.update(deltaTimeInSeconds);
        charPos = this._character.getPosition();
        scientistPos = this._scientist.getPosition();
        if (charPos.x >= WORLD.gameWin) console.log("win!");
        if (charPos.x <= scientistPos.x + (SCIENTIST.width / 3)) {
          return console.log("dead");
        }
      };

      World.prototype.crouchCharacter = function() {
        return this._character.crouch();
      };

      World.prototype.raiseCharacter = function() {
        var collided, surface, _i, _len, _ref, _results,
          _this = this;
        this._character.raise();
        _ref = this._surfaces;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          surface = _ref[_i];
          collided = this._character.collidesTopWith(surface, 0) !== 0;
          if (collided) {
            this._character.crouch();
            _results.push(setTimeout(function() {
              return _this.raiseCharacter();
            }, 1));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };

      World.prototype.getCharacter = function() {
        return this._character;
      };

      World.prototype.getSurfaces = function() {
        return this._surfaces;
      };

      World.prototype.getDecorations = function() {
        return this._decorations;
      };

      World.prototype.getFrontDecorations = function() {
        return this._frontDecorations;
      };

      return World;

    })();
    return World;
  });

}).call(this);

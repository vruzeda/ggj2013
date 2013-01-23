define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "loadingScreen"
], (Kinetic, Screen, ImageLoader, LoadingScreen) ->

    class SplashScreen extends Screen

        _constructLayout: ->
            rect = new Kinetic.Rect
                width:  @getWidth()
                height: @getHeight()
                fill: "red"
                opacity: 0
            @_layer.add rect

            ImageLoader.addToList
                IMPLICIT_TECHNOLOGIES:
                    html5: "http://www.w3schools.com/html/img_html5_html5.gif"
                    nodejs: "http://nodejs.org/images/logo.png"
                    git: "http://git-scm.com/images/logo@2x.png"
                    "top_logo_2": "http://thumbs.dreamstime.com/img/top_logo_2.jpg"
                    "seamless-pattern-28656894": "http://thumbs.dreamstime.com/m/seamless-pattern-28656894.jpg"
                    "seamless-pattern-28656781": "http://thumbs.dreamstime.com/m/seamless-pattern-28656781.jpg"
                    "seamless-pattern-28656750": "http://thumbs.dreamstime.com/m/seamless-pattern-28656750.jpg"
                    "valentine-card-28656675": "http://thumbs.dreamstime.com/m/valentine-card-28656675.jpg"
                    "fashion-girls-28656635": "http://thumbs.dreamstime.com/m/fashion-girls-28656635.jpg"
                    "young-woman-abstract-modern-speech-bubble-28655990": "http://thumbs.dreamstime.com/m/young-woman-abstract-modern-speech-bubble-28655990.jpg"
                    "young-woman-gesturing-modern-origami-copy-space-28655986": "http://thumbs.dreamstime.com/m/young-woman-gesturing-modern-origami-copy-space-28655986.jpg"
                    "pretty-lady-holding-light-bulb-balloon-28655964": "http://thumbs.dreamstime.com/m/pretty-lady-holding-light-bulb-balloon-28655964.jpg"
                    "happy-woman-holding-smiling-balloons-drawing-28655963": "http://thumbs.dreamstime.com/m/happy-woman-holding-smiling-balloons-drawing-28655963.jpg"
                    "happy-lady-holding-green-globe-balloon-28655954": "http://thumbs.dreamstime.com/m/happy-lady-holding-green-globe-balloon-28655954.jpg"
                    "young-woman-making-gestures-28655946": "http://thumbs.dreamstime.com/m/young-woman-making-gestures-28655946.jpg"
                    "young-lady-gesturing-copy-space-28655938": "http://thumbs.dreamstime.com/m/young-lady-gesturing-copy-space-28655938.jpg"
                    "young-woman-holding-colorful-balloons-28655937": "http://thumbs.dreamstime.com/m/young-woman-holding-colorful-balloons-28655937.jpg"
                    "beautiful-lady-smoking-cigarette-idea-cloud-28655901": "http://thumbs.dreamstime.com/m/beautiful-lady-smoking-cigarette-idea-cloud-28655901.jpg"
                    "beautiful-young-woman-juggling-statistics-graphs-28655889": "http://thumbs.dreamstime.com/m/beautiful-young-woman-juggling-statistics-graphs-28655889.jpg"
                    "young-girl-standing-juggling-red-balls-28655873": "http://thumbs.dreamstime.com/m/young-girl-standing-juggling-red-balls-28655873.jpg"
                    "young-lady-standing-juggling-light-bulbs-28655864": "http://thumbs.dreamstime.com/m/young-lady-standing-juggling-light-bulbs-28655864.jpg"
                    "leaf-macro-28655654": "http://thumbs.dreamstime.com/m/leaf-macro-28655654.jpg"
                    "field-daisies-28655653": "http://thumbs.dreamstime.com/m/field-daisies-28655653.jpg"
                    "texture-stucco-28654455": "http://thumbs.dreamstime.com/m/texture-stucco-28654455.jpg"
                    "seamless-paper-texture-28654445": "http://thumbs.dreamstime.com/m/seamless-paper-texture-28654445.jpg"
                    "texture-old-wooden-boards-28654444": "http://thumbs.dreamstime.com/m/texture-old-wooden-boards-28654444.jpg"
                    "green-grass-28654436": "http://thumbs.dreamstime.com/m/green-grass-28654436.jpg"
                    "clover-28654423": "http://thumbs.dreamstime.com/m/clover-28654423.jpg"
                    "valentine-background-28654422": "http://thumbs.dreamstime.com/m/valentine-background-28654422.jpg"
                    "seamless-valentine-background-28654417": "http://thumbs.dreamstime.com/m/seamless-valentine-background-28654417.jpg"
                    "valentine-background-28654411": "http://thumbs.dreamstime.com/m/valentine-background-28654411.jpg"
                    "old-card-wooden-planks-28654406": "http://thumbs.dreamstime.com/m/old-card-wooden-planks-28654406.jpg"
                    "seamless-background-28654400": "http://thumbs.dreamstime.com/m/seamless-background-28654400.jpg"
                    "seamless-valentine-background-28654399": "http://thumbs.dreamstime.com/m/seamless-valentine-background-28654399.jpg"
                    "christmas-background-28654398": "http://thumbs.dreamstime.com/m/christmas-background-28654398.jpg"
                    "set-vector-floral-backgrounds-28654396": "http://thumbs.dreamstime.com/m/set-vector-floral-backgrounds-28654396.jpg"
                    "set-vector-floral-backgrounds-28654394": "http://thumbs.dreamstime.com/m/set-vector-floral-backgrounds-28654394.jpg"
                    "christmas-background-28654387": "http://thumbs.dreamstime.com/m/christmas-background-28654387.jpg"
                    "abstract-vector-backgrounds-28654382": "http://thumbs.dreamstime.com/m/abstract-vector-backgrounds-28654382.jpg"
                    "mardi-gras-28653042": "http://thumbs.dreamstime.com/m/mardi-gras-28653042.jpg"
                    "teddy-bears-love-28653040": "http://thumbs.dreamstime.com/m/teddy-bears-love-28653040.jpg"
                    "groundhog-day-28653036": "http://thumbs.dreamstime.com/m/groundhog-day-28653036.jpg"
                    "groundhog-scared-their-shadow-28653032": "http://thumbs.dreamstime.com/m/groundhog-scared-their-shadow-28653032.jpg"
                    "swing-set-playground-28652151": "http://thumbs.dreamstime.com/m/swing-set-playground-28652151.jpg"
                    "preparing-filter-coffee-portable-filter-28652018": "http://thumbs.dreamstime.com/m/preparing-filter-coffee-portable-filter-28652018.jpg"
                    "curl-fresh-summer-butter-28652006": "http://thumbs.dreamstime.com/m/curl-fresh-summer-butter-28652006.jpg"
                    "healthy-continental-breakfast-28652002": "http://thumbs.dreamstime.com/m/healthy-continental-breakfast-28652002.jpg"
                    "portable-china-filter-ground-coffee-28651980": "http://thumbs.dreamstime.com/m/portable-china-filter-ground-coffee-28651980.jpg"
                    "strawberries-whipped-cream-28651978": "http://thumbs.dreamstime.com/m/strawberries-whipped-cream-28651978.jpg"
                    "strawberries-yoghurt-28651974": "http://thumbs.dreamstime.com/m/strawberries-yoghurt-28651974.jpg"
                    "delicious-homemade-strawberry-preserve-28651971": "http://thumbs.dreamstime.com/m/delicious-homemade-strawberry-preserve-28651971.jpg"
                    "elegant-jar-berry-jam-28651969": "http://thumbs.dreamstime.com/m/elegant-jar-berry-jam-28651969.jpg"
                    "strawberries-cream-waffle-28651951": "http://thumbs.dreamstime.com/m/strawberries-cream-waffle-28651951.jpg"
                    "golden-waffle-strawberries-cream-28651947": "http://thumbs.dreamstime.com/m/golden-waffle-strawberries-cream-28651947.jpg"
                    "crisp-golden-waffles-strawberries-cream-28651928": "http://thumbs.dreamstime.com/m/crisp-golden-waffles-strawberries-cream-28651928.jpg"
                    "bouquet-delicate-pink-roses-28651915": "http://thumbs.dreamstime.com/m/bouquet-delicate-pink-roses-28651915.jpg"
                    "single-fragile-faded-pink-rose-28651905": "http://thumbs.dreamstime.com/m/single-fragile-faded-pink-rose-28651905.jpg"
                    "closeup-beautiful-pink-rose-28651903": "http://thumbs.dreamstime.com/m/closeup-beautiful-pink-rose-28651903.jpg"
                    "closeup-slice-bread-candies-28651894": "http://thumbs.dreamstime.com/m/closeup-slice-bread-candies-28651894.jpg"
                    "tasty-breakfast-made-bread-candies-28651892": "http://thumbs.dreamstime.com/m/tasty-breakfast-made-bread-candies-28651892.jpg"
                    "strawberry-jam-cream-bread-28651884": "http://thumbs.dreamstime.com/m/strawberry-jam-cream-bread-28651884.jpg"
                    "tasty-continental-breakfast-28651850": "http://thumbs.dreamstime.com/m/tasty-continental-breakfast-28651850.jpg"
                    "boiled-egg-coffee-breakfast-28651829": "http://thumbs.dreamstime.com/m/boiled-egg-coffee-breakfast-28651829.jpg"
                    "cup-strong-espresso-coffee-28651827": "http://thumbs.dreamstime.com/m/cup-strong-espresso-coffee-28651827.jpg"
                    "croissant-espresso-28651822": "http://thumbs.dreamstime.com/m/croissant-espresso-28651822.jpg"
                    "croissant-served-espresso-28651813": "http://thumbs.dreamstime.com/m/croissant-served-espresso-28651813.jpg"
                    "postcard-28651737": "http://thumbs.dreamstime.com/m/postcard-28651737.jpg"
                    "postcard-28651695": "http://thumbs.dreamstime.com/m/postcard-28651695.jpg"
                    "postcard-28651647": "http://thumbs.dreamstime.com/m/postcard-28651647.jpg"
                    "postcard-28651608": "http://thumbs.dreamstime.com/m/postcard-28651608.jpg"
                    "postcard-28651593": "http://thumbs.dreamstime.com/m/postcard-28651593.jpg"
                    "postcard-28651562": "http://thumbs.dreamstime.com/m/postcard-28651562.jpg"
                    "postcard-28651512": "http://thumbs.dreamstime.com/m/postcard-28651512.jpg"
                    "yellow-mushroom-red-cap-28650719": "http://thumbs.dreamstime.com/m/yellow-mushroom-red-cap-28650719.jpg"
                    "yellow-coral-fungus-28650594": "http://thumbs.dreamstime.com/m/yellow-coral-fungus-28650594.jpg"
                    "layered-white-fungus-28650571": "http://thumbs.dreamstime.com/m/layered-white-fungus-28650571.jpg"
                    "waterfall-rocks-detail-28650483": "http://thumbs.dreamstime.com/m/waterfall-rocks-detail-28650483.jpg"
                    "leaf-frost-pattern-28650461": "http://thumbs.dreamstime.com/m/leaf-frost-pattern-28650461.jpg"
                    "sky-clouds-28649525": "http://thumbs.dreamstime.com/m/sky-clouds-28649525.jpg"
                    "sky-clouds-28649519": "http://thumbs.dreamstime.com/m/sky-clouds-28649519.jpg"
                    "sky-clouds-28649517": "http://thumbs.dreamstime.com/m/sky-clouds-28649517.jpg"
                    "sky-clouds-28649462": "http://thumbs.dreamstime.com/m/sky-clouds-28649462.jpg"
                    "sky-clouds-28649461": "http://thumbs.dreamstime.com/m/sky-clouds-28649461.jpg"
                    "resurrection-painting-sansepolcro-cathedral-28648958": "http://thumbs.dreamstime.com/m/resurrection-painting-sansepolcro-cathedral-28648958.jpg"
                    "resurrection-painting-sansepolcro-cathedral-28648958": "http://thumbs.dreamstime.com/m/seamless-pattern-28656894.jpg"
                    "bottom_logo": "http://thumbs.dreamstime.com/site-img/bottom_logo.jpg"

            required =
                list: ["IMPLICIT_TECHNOLOGIES"]

                progressCallback: (total, complete, success) =>
                    rect.setOpacity complete / total
                    @redraw()

                completeCallback: =>
                    @_game.showScreen new LoadingScreen @_game
                    @_game.hideScreen @

            background =
                list: []
                progressCallback: null
                completeCallback: null

            ImageLoader.loadImages required, background

        _constructInputEvents: (inputController) ->


    return SplashScreen
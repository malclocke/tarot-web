if (typeof Tarot == 'undefined') {
  Tarot = {
    Views: {}
  };
}

Tarot.loadNextNightImage = function(blink) {
  var nightImage = new Tarot.NightImage({});
  nightImage.url = Tarot.Config.nextNightImageUrl;
  nightImage.fetch({
    success: function(model, response, options) {
      model.url = options.xhr.getResponseHeader('Location');
      var blinkView = new Tarot.Views.BlinkView({
        el: $('#controls'),
        model: model
      }).render();
      var nightImageInfoView = new Tarot.Views.NightImageInfoView({
        el: $('#left-column'), model: model
      }).render();
    }
  });
}

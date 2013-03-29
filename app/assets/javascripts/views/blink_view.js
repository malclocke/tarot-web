Tarot.Views.BlinkView = Backbone.View.extend({

  render: function() {
    this.$el.empty();
    var referenceElement = $('<div></div>');
    var candidateElement = $('<div style="display: none;"></div>');
    var blink = new Blink({
      referenceElement: referenceElement.get(0),
      candidateElement: candidateElement.get(0)
    });
    blink.setCandidate(this.model.get('fits'));
    blink.setReference(this.model.get('reference_fits'));
    var gui = new dat.GUI({autoPlace: false, width: 308});
    gui.close();
    var controls = document.getElementById('controls');
    controls.appendChild(gui.domElement);
    gui.add(blink, 'blink_speed', 200, 2000);//.onChange(blink.setBlinkInterval);
    gui.add(
      blink, 'stretch', ['linear', 'logarithm', 'sqrt', 'arcsinh', 'power']
    ).onChange(blink.onStretchChange);
    this.$el.append(referenceElement);
    this.$el.append(candidateElement);
    return this;
  }
});

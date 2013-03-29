Tarot.Views.NightImageInfoView = Backbone.View.extend({
  render: function() {
    this.$('h1').text(this.model.escape('galaxy_name'));
    this.$('#timestamp').text(this.model.escape('timestamp'));
    this.$('#archive_name').text(this.model.escape('archive_name'));
    this.$('#reference_timestamp').text(this.model.escape('reference_timestamp'));
    return this;
  }
});

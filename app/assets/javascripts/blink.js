var Blink = function(opts) {

  if (typeof opts == 'undefined') {
    opts = {};
  }

  var that = this;

  this.blink_speed = 1000;
  this.stretch = 'asinh';

  this.referenceElement = opts.referenceElement;
  this.candidateElement = opts.candidateElement;

  this.blink = function() {

    var referenceElement = that.getReferenceElement();
    var candidateElement = that.getCandidateElement();

    if (candidateElement.style.display === 'none') {
      candidateElement.style.display = 'block';
      referenceElement.style.display = 'none';
    } else {
      candidateElement.style.display = 'none';
      referenceElement.style.display = 'block';
    }
  };

  this.getReferenceElement = function() {
    return that.referenceElement;
  };

  this.getCandidateElement = function() {
    return that.candidateElement;
  };

  this.setBlinkInterval = function() {
    if (typeof that.blinkIntervalId != 'undefined') {
      clearInterval(that.blinkIntervalId);
    }
    that.blinkIntervalId = setInterval(that.blink, that.blink_speed);
  };

  this.setBlinkObject = function(blinkObject) {
    that.blinkObject = blinkObject;
  };

  this.onStretchChange = function() {
    that.referenceWebfits.setStretch(that.stretch);
    that.candidateWebfits.setStretch(that.stretch);
  };

  // Define callback to be executed after image is received from the server
  this.getImage = function(f, opts) {
    
    // Get first data unit
    var dataunit = f.getDataUnit();
    
    // Set options to pass to the next callback
    opts = {
      dataunit: dataunit,
      el: opts.el,
      webfitsTarget: opts.webfitsTarget
    };
    
    // Asynchronously get pixels representing the image passing a callback and options
    dataunit.getFrameAsync(0, that.createVisualization, opts);
  }
  
  // Define callback for when pixels have been read from file
  this.createVisualization = function(arr, opts) {

    var factor = 4;

    var dataunit = opts.dataunit;
    
    var width = dataunit.width;
    var height = dataunit.height;
    var extent = dataunit.getExtent(arr);
    
    // Get the DOM element
    var el = opts.el;
    
    // Initialize the WebFITS context with a viewer of size width
    var webfits = new astro.WebFITS(el, factor * width);
    that[opts.webfitsTarget] = webfits;
    
    // Add pan and zoom controls
    webfits.setupControls();

    webfits.xOffset = -width / 2;
    webfits.yOffset = -width / 2;
    webfits.zoom = (factor / 2) / width;
    
    // Load array representation of image
    webfits.loadImage('some-identifier', arr, width, height);
    
    // Set the intensity range and stretch
    webfits.setExtent(extent[0], extent[1]);
    webfits.setStretch('sqrt');

  }

  this.setReference = function(path) {
    var opts = {el: that.referenceElement, webfitsTarget: 'referenceWebfits'};
    
    // Initialize the FITS file, passing the function getImage as a callback
    var f = new astro.FITS.File(path, that.getImage, opts);
  };

  this.setCandidate = function(path) {
    var opts = {el: that.candidateElement, webfitsTarget: 'candidateWebfits'};
    
    // Initialize the FITS file, passing the function getImage as a callback
    var f = new astro.FITS.File(path, that.getImage, opts);
  };

  this.setBlinkInterval();
};

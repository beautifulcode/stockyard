var Stockyard = Class.create();
Stockyard.prototype = {
  initialize : function(){
    this.setup_new_content_form();
    this.setup_image_previews();
  }, 
  
  setup_image_previews: function(){
    $$('.basic_image_preview').each(function(preview) {
      preview.observe('hover', function(p){p.toggleClassName('hover')});
    });
  },
  
  setup_new_content_form: function(){
    content_type_select = $('content_mapping_asset_type_selector');
    if(content_type_select){
    content_type_select.observe('change', function(e){
      window.location = '/content/new?asset_type=' + $F('content_mapping_asset_type_selector');
    });
    }
  }
};

Event.observe(window, 'load', function(){
  var stockyard = new Stockyard();
});

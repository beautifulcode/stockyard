# Set the default text field size when input is a string. Default is 50
  Formtastic::SemanticFormBuilder.default_text_field_size = 30

  # Should all fields be considered "required" by default
  # Defaults to true, see ValidationReflection notes below
  Formtastic::SemanticFormBuilder.all_fields_required_by_default = false

  # Set the string that will be appended to the labels/fieldsets which are required
  # It accepts string or procs and the default is a localized version of
  # '<abbr title="required">*</abbr>'. In other words, if you configure formtastic.required
  # in your locale, it will replace the abbr title properly. But if you don't want to use
  # abbr tag, you can simply give a string as below
  Formtastic::SemanticFormBuilder.required_string = "(required)" 

  # Set the string that will be appended to the labels/fieldsets which are optional
  # Defaults to an empty string ("") and also accepts procs (see required_string above)
  Formtastic::SemanticFormBuilder.optional_string = "(optional)" 

  # Set the way inline errors will be displayed.
  # Defaults to :sentence, valid options are :sentence, :list and :none
  Formtastic::SemanticFormBuilder.inline_errors = :list

  # Set the method to call on label text to transform or format it for human-friendly reading
  # Defaults to :to_s, because we are already using human_attribute_name when creating labels,
  # but you might want to change for :titleize or another string method
  Formtastic::SemanticFormBuilder.label_str_method = :titleize

  # Set the array of methods to try calling on parent objects in :select and :radio inputs
  # for the text inside each @<option>@ tag or alongside each radio @<input>@.  The first method
  # that is found on the object will be used.
  # Defaults to ["to_label", "display_name", "full_name", "name", "title", "username", "login", "value", "to_s"]
  Formtastic::SemanticFormBuilder.collection_label_methods = ["title_and_author", "display_name", "login", "to_s"]

  # Formtastic by default renders inside li tags the input, hints and then
  # errors messages. Sometimes you want the hints to be rendered first than
  # the input, in the following order: hints, input and errors. You can
  # customize it doing just as below:
  Formtastic::SemanticFormBuilder.inline_order = [:hints, :input, :errors]

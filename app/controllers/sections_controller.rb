class SectionsController < ApplicationController
  before_filter :require_user
  layout 'stockyard'
  resource_controller
end

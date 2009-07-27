class PageTemplatesController < ApplicationController
  before_filter :require_user
  resource_controller
end

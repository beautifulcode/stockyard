class AssetsController < ResourceController::Base

  layout :determine_layout
  
  
  def determine_layout
    if params[:action] == 'show'
      'default'
    else
      'stockyard'
    end
  end

end

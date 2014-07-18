class PledgesController < ApplicationController
	before_filter :ensure_logged_in, :only => [:create]
  def create
  end
end

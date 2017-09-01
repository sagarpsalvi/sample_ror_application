require 'json'

class TestController < ApplicationController

  def all_data
    render :json => { :error => 0, :success => 1 }
  end
end

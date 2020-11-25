# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :hello

  def hello
    puts 'HELLO'
  end
end

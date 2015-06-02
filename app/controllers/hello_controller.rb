# -*- coding: utf-8 -*-

class HelloController < ApplicationController
  def index
    render text: 'こんにちは、世界！'
  end
  def show
    @msg = 'こんにちは、世界！'
  end
  def list
    @books = Book.all
  end
  def app_var
    render text: MY_APP['logo']['source']
  end
end

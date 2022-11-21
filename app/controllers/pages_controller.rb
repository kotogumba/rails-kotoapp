class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @url = "https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5"
    @user_serialized = URI.open(@url).read
    @user = JSON.parse(@user_serialized)
  end
end

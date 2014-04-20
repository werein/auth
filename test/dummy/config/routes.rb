Rails.application.routes.draw do

  mount Auth::Engine => "/"
  mount Foundationstone::Engine => "/"
end

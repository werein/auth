Rails.application.routes.draw do
  root to: "welcome#index"
  mount Auth::Engine => "/auth"
  mount Foundationstone::Engine => "/"
end

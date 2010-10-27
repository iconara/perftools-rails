Rails.application.routes.draw do
  resource :profiler, :controller => :profiler, :only => %w(show) do
    get 'start'
    get 'stop'
    get 'status'
  end
end
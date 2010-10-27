Rails.application.routes.draw do |map|
  resource :profiler, :controller => :profiler, :only => %w(show) do
    get 'start'
    get 'stop'
    get 'status'
  end
end
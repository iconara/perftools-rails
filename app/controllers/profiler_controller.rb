require 'perftools'


class ProfilerController < ApplicationController
  unloadable
  
  def start
    session[:profiler_id] = rand(100000).to_s(16)
    logger.info("Profile #{session[:profiler_id]}")
    PerfTools::CpuProfiler.start(profile_path(session[:profiler_id]))
    send_status
  end
  
  def stop
    PerfTools::CpuProfiler.stop
    send_status(:stopped)
    session[:profiler_id] = nil
  end
  
  def status
    send_status
  end
  
  def show
    id = params[:id]
    path = graph_path(id)
    logger.info(%x(pprof.rb --pdf #{profile_path(id)} > #{path}))
    send_data File.read(path), :filename => File.basename(path),
                               :type => 'application/pdf',
                               :disposition => 'inline'
  end
  
private

  def send_status(status_override=nil)
    status = {}
    status[:status] = :running if session[:profiler_id]
    status[:status] = status_override if status_override
    status[:id]     = session[:profiler_id]
    render :json => status
  end
  
  def profile_path(id)
    "/tmp/profile-#{id}"
  end
  
  def graph_path(id)
    "/tmp/profile-#{id}.pdf"
  end
end
  
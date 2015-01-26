class ServicePool

  def self.running?(user)
    user.client_control_events.last.running?
  end

  def self.run(user, keywords)
    user.client_control_events.create(command: 'run')
    CelluloidTwitterService.new(user, keywords).async.start
  end

  def self.stop(user)
    user.client_control_events.create(command: 'stop')
  end

end

class ClientControlEvent < ActiveRecord::Base
  belongs_to :user

  def running?
    command == 'run'
  end

  def stop?
    command == 'stop'
  end
end

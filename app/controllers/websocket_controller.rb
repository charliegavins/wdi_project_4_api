class ApiController < ApplicationCable::Channel

  def initialize_session
    # perform application setup here
    # controller_store[:message_count] = 0
  end
end

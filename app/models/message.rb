class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  # after save to database, will Perform MessageBroadcast
end

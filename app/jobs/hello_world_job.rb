class HelloWorldJob < ActiveJob::Base
  queue_as :default
  def perform(*args)
    puts 'Hello World!'
    puts args
  end
end
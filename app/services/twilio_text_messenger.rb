class TwilioTextMessenger
  attr_reader :message
  attr_reader :receiver

  attr_reader :message

  def initialize(message, receiver)
    @message = message
    @receiver = receiver
  end

  def call
    # client = Twilio::REST::Client.new
    # client.messages.create({
    #   from: "+12108995679",
    #   to: "+91#{receiver}",
    #   body: message
    # })
  end

#   def phone_call
#     client = Twilio::REST::Client.new
#     call = client.calls.create(
#     from: "+12108995679",
#     to: "+91#{receiver}",
#     url: "http://demo.twilio.com/docs/voice.xml")
# 	puts call.to
#   end
 end
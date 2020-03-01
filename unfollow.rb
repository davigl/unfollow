# frozen_string_literal: true

require_relative 'lib/github'
require 'base64'

##
# This class represents Unfollow model.

class Unfollow
  include Github

  def initialize(username, password, white_list)
    @username = username
    @white_list = white_list
    @credentials = Base64.encode64("#{username}:#{password}")
  end

  ##
  # Method that loops through user followed page and unfollow who doesn't
  # follow you back.

  def unfollow
    current_page = 1
    loop do
      followed = followed_users(@credentials, current_page)

      current_page += 1

      followed.any? ? unfollow_all(@credentials, @username, followed, @white_list) : break
    end
  end
end

##
# Params: username, password, white_list

action = Unfollow.new(ARGV[0].to_s, ARGV[1].to_s, ARGV[2..-1])

action.unfollow

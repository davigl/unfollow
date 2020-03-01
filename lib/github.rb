# frozen_string_literal: true

require 'httparty'
require 'base64'

module Github
  ##
  # Unfollow an github user.
  # Params: credentials:string, target:string

  def unfollow_user(credentials, target)
    base_uri = URI("https://api.github.com/user/following/#{target}")

    HTTParty.delete(base_uri.to_s, headers: {
                      'Authorization' => ('Basic ' + credentials),
                      'User-Agent' => 'Patassaura'
                  })

    puts "unfollowed #{target}"
  end

  ##
  # Getting users that you follow.
  # Params: current_page:integer

  def followed_users(credentials, current_page)
    base_uri = URI("https://api.github.com/user/following?page=#{current_page}")

    response = HTTParty.get(base_uri.to_s, headers: {
                              'Authorization' => ('Basic ' + credentials),
                              'User-Agent' => 'Patassaura'
                            }).parsed_response

    response
  end

  ##
  # Check if an user follows you back.
  # Params: target:string, user:string

  def check_follow_back(target, user)
    base_uri = URI("https://api.github.com/users/#{target}/following/#{user}")

    response = HTTParty.get(base_uri.to_s, headers: {
      'User-Agent' => 'Patassaura'
    }).code

    response.eql? 404
  end

  ##
  # Method that iterates through followed users and starts to unfollow everyone
  # who doesn't follow you and it's not inside your white_list.
  # Params: credentials:string, username:string, json

  def unfollow_all(credentials, username, followed, white_list)
    followed.each do |user|
      target_user = user['login']

      if !white_list.include?(target_user) && check_follow_back(target_user, username)
        unfollow_user(credentials, target_user)
      end
    end
  end
end

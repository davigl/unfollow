<h1 align="center"> Github Unfollower </h1>

Ruby script to unfollow users that doesn't follow you back, your **white list** will **prevent** to unfollow some specific users.

---

## Prerequisites:

```
• httparty
• ruby >= 1.9.2
• rubygems >= 1.3.1
```

## Installing:

###### Clone Repository

```shell
git clone https://github.com/Davigl/github-follow-api.git
```

###### Check your Ruby version

```shell
$ ruby -v
```

**If you dont have it, install using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):**

```shell
$ rbenv install version
```

###### Install httparty gem

```shell
$ gem install httparty
```

## Running the script:

**To run this script you need to insert your github credentials (username, password)**

**Note:** *If you doesn't want to unfollow some specific users, insert they usernames after password separated by space.*

```ruby
$ ruby unfollow.rb <login> <password> <white-list>
```

**Example:**
```ruby
$ ruby unfollow.rb my_username my_password user1 user2
```

*Where **user1** and **user2** are users that you doesnt want to unfollow.*


### License

Licensed by [GNU General Public License v3.0](https://github.com/Davigl/github-unfollower/blob/master/LICENSE).

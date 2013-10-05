class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # attr_accessible :provider, :uid

  # Check if the Facebook user alredy exists on the App's User Table.
  # If the user exists return it, else create a new user for it on the table.
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
        )
      end
    end
  end

  # Check if the Google user alredy exists on the App's User Table.
  # If the user exists return it, else create a new user for it on the table.
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data['name'],
                           provider:access_token.provider,
                           email: data['email'],
                           uid: access_token.uid ,
                           password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  # Check if the Twitter user alredy exists on the App's User Table.
  # If the user exists return it, else create a new user for it on the table.
  # AS Twitter don't let any external app to get user's email, Bug Brother App
  # generetes a random twitter email.
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + '@twitter.com').first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.uid+'@twitter.com',
                           password:Devise.friendly_token[0,20],
        )
      end
    end
  end
end

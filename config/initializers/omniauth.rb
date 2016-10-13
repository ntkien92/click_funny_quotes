Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
    scope: 'email,user_birthday,publish_actions,user_friends,read_custom_friendlists', image_size: 'large'
end
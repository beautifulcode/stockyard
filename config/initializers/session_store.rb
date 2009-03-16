# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stockyard_session',
  :secret      => '864519e28b7e9ac13e64877809f0622667c9a763ae11f2f4f78901fbdf1e98510a7af523aa40ea71e87cc52d05d178d5d9f4a6f455ec2693359f60b892acd5fa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

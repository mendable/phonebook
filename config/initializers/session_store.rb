# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_contacts_session',
  :secret      => 'c665ffeb1e0d9167b599d119ec7df329ca40bd0da3168610cbd10bd72f8de7968c2cfa47203949ad5c1356e11bbd1db80c7603b5cd7696136784152343f1d8b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

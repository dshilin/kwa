# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_initial_release_session',
  :secret      => '2f9ce7ec572c197dfb127ce8e501e9dd46855750329d9bf942cb09a9ed205bf4faf1fc173abb96ad2cf5335f11b0eadb7f9fac43172081105e2de596aaddfb08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

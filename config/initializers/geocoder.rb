# config/initializers/geocoder.rb

# geocoding service (see below for supported options):
Geocoder::Configuration.lookup = :google

# to use an API key:
Geocoder::Configuration.api_key = "AIzaSyB2l6Sc_i5guELQZ_g_KMbEfkt4WZwR03k"

# geocoding service request timeout, in seconds (default 3):
Geocoder::Configuration.timeout = 5

# use HTTPS for geocoding service connections:
Geocoder::Configuration.use_https = false


# language to use (for search queries and reverse geocoding):
Geocoder::Configuration.language = "en-AU"
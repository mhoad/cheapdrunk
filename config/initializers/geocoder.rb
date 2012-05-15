# config/initializers/geocoder.rb

# geocoding service (see below for supported options):
Geocoder::Configuration.lookup = :google

# geocoding service request timeout, in seconds (default 3):
Geocoder::Configuration.timeout = 5
require 'haversine'
require 'pry'

distance = Haversine.distance(35.61488, 139.5813, 48.85341, 2.3488)
binding.pry
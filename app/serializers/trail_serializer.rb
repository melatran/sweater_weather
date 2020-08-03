class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :trail_info
end

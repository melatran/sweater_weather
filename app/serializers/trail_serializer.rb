class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :trails
end

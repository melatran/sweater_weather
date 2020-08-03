class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast_info, :trails
end

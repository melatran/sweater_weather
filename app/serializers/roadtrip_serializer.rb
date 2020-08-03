class RoaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination
end

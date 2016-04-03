json.array!(@cars) do |car|
  json.extract! car, :id, :plate_number, :car_model, :contact_number, :model_year, :user_id
  json.url car_url(car, format: :json)
end

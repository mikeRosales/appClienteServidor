json.array!(@activities) do |activity|
  json.extract! activity, :id, :activity_id, :activity_name, :start_date, :end_date, :responsibles
  json.url activity_url(activity, format: :json)
end

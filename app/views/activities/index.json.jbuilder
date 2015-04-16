json.array!(@activities) do |activity|
  json.extract! activity, :id,  :activity_name, :start_date, :end_date, :responsibles, :project_id
  json.url activity_url(activity, format: :json)
end

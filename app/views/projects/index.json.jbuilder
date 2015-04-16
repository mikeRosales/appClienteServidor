json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :company, :description, :participants, :user_id, :startDate, :endDate
  json.url project_url(project, format: :json)
end

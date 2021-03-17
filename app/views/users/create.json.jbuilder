json.user do
  json.id @user.id
  json.name @user.name
  json.last_name @user.last_name
  json.email @user.email


  if @user.errors.any?
    json.error_count @user.errors.count
    json.errors @user.errors.full_messages
  end
end

json.user do
  json.id @user.id
  json.name @user.name
  json.last_name @user.last_name
  json.email @user.email

  if @user.errors.any?
    json.errors @user.errors.full_messages
  end
end

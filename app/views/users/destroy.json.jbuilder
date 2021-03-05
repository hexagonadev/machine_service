json.user @user, :name, :last_name, :email
json.response "ELIMINADO"

if @user.errors.any?
  json.errors @user.errors.full_messages
end

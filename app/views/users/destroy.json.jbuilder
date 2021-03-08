json.user do
  json.name @user.name
  json.last_name @user.last_name
  json.email @user.email


  if @user.errors.any?
    json.errors @user.errors.full_messages
  else
   "Usuario Eliminado con exito"
  end
end

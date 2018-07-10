require 'sinatra'
require 'make_todo'

get '/' do
  @notes = Tarea.all 
  @title = 'Lista de Tareas' #título que la página
  erb :home
end

#adicionando una nota en home viene de la textarea del formulario home.erb
post '/' do
  n = Tarea.create("#{params[:content]}")
  redirect '/'
end

#Al dar click en delete despliega el formulario del archivo delete.erb con la información cargada de la nota con la opción de eliminar
get '/:id/delete' do
  @note = Tarea.find(params[:id])
  @title = "Confirmar borrado de nota ##{params[:id]}"
  erb :delete #direcciona a views/delete.erb
end

#borrar una ruta desde el formulario delete.erb
delete '/:id' do
  Tarea.destroy(params[:id])
  redirect '/'
end

#Actualiza el atributo de `done` de la tarea pasandolo de `false` a `true` desde el formulario de home.erb
get '/:id/complete' do
  Tarea.update(params[:id])
  redirect '/'
end


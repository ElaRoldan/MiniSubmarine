before '/secret' do 
  #¿Qué va en esta parte para aplicar el filtro que da entrada al juego?
  unless session[:user_id]
    #Envia mensaje de error al ususario 
    @message = "No tienes una sesión por favor haz log in"
    redirect to "/"
  end  
end 

get '/' do
  erb :index
end



get '/secret' do
  erb :secret
end


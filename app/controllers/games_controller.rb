get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y
  #número de juegos ganados?
  @rounds = Game.where(user_id: params[:user_id])
  @games_won = []
  @rounds.each do |round|
    if round.score == 2 
      @games_won << round  
    end  
  end  
  @games_won 
  erb :round
end

post '/games' do
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?
  tries = params[:tries]
  destroyed_submarines = params[:sub_destroyed]
     
  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
  if tries  == "4" || destroyed_submarines == "2"
    Game.create(user_id: current_user.id, score: destroyed_submarines)
  end  
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
  if logged_in?
    redirect to "/secret"
  else
    redirect to "/"
  end
end

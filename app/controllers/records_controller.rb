get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
  @round_won = Game.where(score: 2)
  winners_relation = @round_won.group_by {|user| user.user_id}
  @winners_hash = {}
  winners_relation.each do |key, value|
    name = User.find(key).name
    win = value.count
    @winners_hash[name] = win  
  end
  @winners_hash
  erb :record 
end



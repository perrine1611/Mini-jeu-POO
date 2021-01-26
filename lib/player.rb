require 'pry'

class Player

attr_accessor :name, :life_points 

	def initialize(name) # On rentre uniquement le nom du joueur, les life points commencent à 10.
		@name = name
		@life_points = 10
	end

	def show_state # Reprend le nom du joueur et ses points de vie.
		puts "#{@name} a #{@life_points} points de vie." 
	end

	def gets_damage(damage_received) # Calcule les dommages et les soustrait aux point de vies. Si <=0, perdu
		@life_points = @life_points - damage_received

		if @life_points <=0 
		puts "Le joueur #{name} a été tué !"
	end
	end

	def attacks(player) # Attaque d'un jour contre un autre
		puts "#{@name} attaque #{player.name}"
		@damage = compute_damage
		player.gets_damage(@damage)
		puts "Il lui inflige #{@damage} points de dommages"
	end

	def compute_damage
    	return rand(1..6)
  	end

end

class HumanPlayer < Player

attr_accessor :weapon_level

	def initialize(name) # On rentre uniquement le nom du joueur, les life points commencent à 100 + weapon_level à 1
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}" 
	end

	def compute_damage # La valeur du dommage (aléatoire) multiplié par le niveau de l'arme
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon # Nouvelle arme avec niveau aléatoire. Si supérieur = le joueur la garde sinon on garde l'ancienne
  		@new_weapon = rand(1..6)
  		puts "Tu as trouvé une arme de niveau #{@new_weapon}"
  		if @new_weapon > @weapon_level
  			then @new_weapon = @weapon_level
  			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  		else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  		end
  	end

  	def search_health_pack
  		result = rand(1..6)
  		if result = 1 
  		puts "Tu n'as rien trouvé"
  		elsif result(1..5) then @life_points = @life_points + 50
  		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  		elsif result = 6 then @life_points = @life_points + 80
  		puts "Waow, tu as trouvé un pack de +80 points de vie !"
  		end
  	end

 end
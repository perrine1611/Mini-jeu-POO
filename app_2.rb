require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# -------- Accueil
puts "----------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "----------------------"
puts " "
puts "Quel est ton prénom ?"
print ">"
user_name = gets.chomp
user = HumanPlayer.new(user_name)  # Le joueur rentre son prénom

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Bonjour, #{user_name}"

enemies = []
enemies << player1 << player2

while user.life_points >0 && (player1.life_points >0 || player2.life_points >0) #Boucle tant que les joueurs ont des points de vie le combat continue
puts "Voici l'état de #{user_name}"
puts user.show_state
puts " "
puts "Quelle action veux-tu effectuer ?"
puts " "
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts " "
puts "attaquer un joueur en vue :"
puts "0 - #{player1.name} a #{player1.life_points} points de vie"
puts "1 - #{player2.name} a #{player2.life_points} points de vie"
puts " "
puts "Entrer votre choix"
print ">"
user_choice = gets.chomp

if user_choice == "a"
	user.search_weapon

elsif user_choice == "s"
	user.search_health_pack

elsif user_choice == "0"
	user.attacks(player1)

elsif user_choice == "1"
	user.attacks(player2)
end

puts "Les autres joueurs t'attaquent !"

enemies.each do |player|
if player.life_points > 0 
	then player.attacks(user)
end
end
end

puts "La partie est finie"
if user.life_points > 0 
	then puts "BRAVO ! TU AS GAGNE !"
else puts "Loser ! Tu as perdu !"
end


binding.pry
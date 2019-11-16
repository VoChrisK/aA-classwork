class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7 "
        response = gets.chomp
        arr = []
        response.split(" ").each { |char| arr << char.to_i }
        arr
    end
end

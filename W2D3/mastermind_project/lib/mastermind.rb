require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        puts "Exact Matches: " + @secret_code.num_exact_matches(code).to_s
        puts "Near Matches: " +  @secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        puts "Enter a code"
        response = gets.chomp
        code = Code.from_string(response)
        self.print_matches(code)
        if code == @secret_code
            return true
        else
            return false
        end
    end
end

class Dog
    def initialize(name, breed, age, bark, foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age= (num)
        @age = num
    end

    def bark
        if self.age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(string)
        @favorite_foods.include?(string.capitalize)
    end
end

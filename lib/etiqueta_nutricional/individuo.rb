class Individuo

    attr_reader :nombre, :edad, :sexo
    
    def initialize(nombre, edad, sexo)
        @nombre = nombre
        @edad = edad
        @sexo = sexo
    end
end

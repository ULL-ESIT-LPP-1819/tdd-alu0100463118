class Paciente < Individuo
  
    attr_reader :z
  
    def initialize(nombre)
        super(x,y)              #encadenamiento (chaining)
        @z = z
    end
    def initialize(nombre, edad, sexo, peso, altura, circunferencia_cintura, circunferencia_cadera)
        super(nombre, edad, sexo)
        @peso = peso
        @altura = altura
        @circunferencia_cintura = circunferencia_cintura
        @circunferencia_cadera = circunferencia_cadera
    end
end
  
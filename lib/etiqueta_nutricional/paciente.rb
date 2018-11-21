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
    
    def obtener_nombre
        @nombre
    end
    
    def to_s
        cadena = ""
        cadena = cadena + super.to_s
        cadena = cadena + "Peso: #{@peso}kg\n"
        cadena = cadena + "Altura: #{@altura}m\n"
        cadena = cadena + "Circunferencia cintura: #{@circunferencia_cintura}cm\n"
        cadena = cadena + "Circunferencia cadera: #{@circunferencia_cadera}cm\n"
    end

end
  
class Individuo

    attr_reader :nombre, :edad, :sexo
    
    def initialize(nombre, edad, sexo)
        @nombre = nombre
        @edad = edad
        @sexo = sexo
    end
    
    def obtener_nombre
        @nombre
    end
    
    def to_s
        cadena = ""
        sexo = ""
        cadena = cadena + "Nombre: #{@nombre}\n"
        cadena = cadena + "Edad: #{@edad}\n"
        if @sexo == 0
            sexo = "Hombre"
        else
            sexo = "Mujer"
        end
        cadena = cadena + "Sexo: #{sexo}\n"
        return cadena
    end
end

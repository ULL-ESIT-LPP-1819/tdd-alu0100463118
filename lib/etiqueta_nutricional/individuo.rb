class Individuo

    attr_reader :nombre, :edad, :sexo

    include Comparable
    
    def initialize(nombre, edad, sexo)
        @nombre = nombre
        @edad = edad
        @sexo = sexo
    end
    
    def obtener_nombre
        @nombre
    end
    
    def obtener_edad
        @edad
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
    
    def <=>(other)
        return nil unless other.instance_of? Individuo
        @edad <=> other.edad
    end
end

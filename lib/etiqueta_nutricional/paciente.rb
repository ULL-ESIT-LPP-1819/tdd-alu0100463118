class Paciente < Individuo
  
    attr_reader :nombre, :edad, :sexo, :peso, :altura, :circunferencia_cintura, :circunferencia_cadera, :actividad_fisica
    
    include Comparable
  

    def initialize(nombre, edad, sexo, peso, altura, circunferencia_cintura, circunferencia_cadera, actividad_fisica)
        super(nombre, edad, sexo)
        @peso = peso
        @altura = altura
        @circunferencia_cintura = circunferencia_cintura
        @circunferencia_cadera = circunferencia_cadera
        @imc = imc
        @grasa = p_grasa
        @rcc = rcc
        @actividad_fisica = actividad_fisica
        
    end
    
    def imc
        @peso / (@altura * @altura)
    end
    
    def p_grasa
        1.2 * @imc + 0.23 * @edad - 10.8 * @sexo - 5.4
    end
    
    def rcc
        (((@circunferencia_cintura[0].round(2) + @circunferencia_cintura[1].round(2)) / 2) / ((@circunferencia_cadera[0].round(2) + @circunferencia_cadera[1].round(2)) / 2).round(2))
    end
    
    def clasificacion_oms
        if (@imc < 18.5)
            "Bajo peso"
        elsif (@imc < 24.9)
            "Adecuado"
        elsif (@imc < 29.9)
            "Sobrepeso"
        elsif (@imc < 34.9)
            "Obesidad grado 1"
        elsif (@imc < 39.9)
            "Obesidad grado 2"
        else
            "Obesidad grado 3"
        end
    end
    
    def riesgo
        if (@sexo == 0) #mujer
            if (@rcc < 0.75)
                "Riesgo bajo"
            elsif (@rcc < 0.82)
                "Riesgo moderado"
            else
                "Riesgo alto"
            end
        else            #hombre
            if (@rcc < 0.88)
                "Riesgo bajo"
            elsif (@rcc < 0.95)
                "Riesgo moderado"
            elsif (@rcc < 1.01)
                "Riesgo alto"
            else
                "Riesgo muy alto"
            end
        end
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

    def <=>(other)
        return nil unless other.instance_of? Paciente
        @imc <=> other.imc 
    end
    
    def valoracion(menu)
        
        gasto_energetico_basal = 0
        if (@sexo == 1) # mujer
            gasto_energetico_basal = (10 * @peso) + (6.25 * @altura) - (5 * @edad) - 161
        else # Hombre
            gasto_energetico_basal = (10 * @peso) + (6.25 * @altura) - (5 * @edad) + 5
        end
        
        efecto_termogeno = gasto_energetico_basal * 0.1
        gasto_actividad_fisica = 0
        
        if (@actividad_fisica == "reposo")
            gasto_actividad_fisica = gasto_energetico_basal * 0
        elsif (@actividad_fisica == "Actividad ligera")
            gasto_actividad_fisica = gasto_energetico_basal * 0.12
        elsif (@actividad_fisica == "Actividad moderada")
            gasto_actividad_fisica = gasto_energetico_basal * 0.27
        else
            gasto_actividad_fisica = gasto_energetico_basal * 0.54
        end
        
        gasto_energetico_total = gasto_energetico_basal + efecto_termogeno + gasto_actividad_fisica
        calorias_menu = menu.reduce(0) { |sum, value| sum + value.obtener_valor_energetico_kcal }
        
        if (gasto_energetico_total < (calorias_menu * 0.9))
            return true;
        else
            return false;
        end
    end
end
  
class Etiqueta
  
  include Comparable
  
  attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos_de_carbono, :azucares, :proteinas, :sal, :porciones
  
  def initialize(nombre, grasas, grasas_saturadas, hidratos_de_carbono, azucares, proteinas, sal, porciones)
    @nombre = nombre
    @valor_energetico_kj = (grasas * 37) + (grasas_saturadas * 37) + (hidratos_de_carbono * 17) + (azucares * 17) + (proteinas * 17) + (sal * 25)
    @valor_energetico_kcal = (grasas * 9) + (grasas_saturadas * 9) + (hidratos_de_carbono * 4) + (azucares * 4) + (proteinas * 4) + (sal * 6)
    @grasas = grasas
    @grasas_saturadas = grasas_saturadas
    @hidratos_de_carbono = hidratos_de_carbono
    @azucares = azucares
    @proteinas = proteinas
    @sal = sal
    @numero_porciones = porciones[0]
    @gramos_porcion = porciones[1]
  end
  
 
  
  def obtener_nombre
    @nombre
  end
  
  def obtener_grasas
    @grasas
  end
  
  def obtener_grasas_saturadas
    @grasas_saturadas
  end
  
  def obtener_hidratos_carbono
    @hidratos_de_carbono
  end
  
  def obtener_azucar
    @azucares
  end
  
  def obtener_proteinas
    @proteinas
  end
  
  def obtener_sal
    @sal
  end
  
  def obtener_numero_porciones
    @numero_porciones
  end
  
  def obtener_valor_energetico_kj
    @valor_energetico_kj
  end
  
  def obtener_valor_energetico_kcal
    @valor_energetico_kcal
  end
  
  def ir_valor_energetico_kj
    (@valor_energetico_kj.round(2) / 8400 * 100).round(2)
  end
  
  def ir_valor_energetico_kcal
    (@valor_energetico_kcal.round(2) / 2000 * 100).round(2)
  end
  
  def ir_grasa_total
    ((@grasas.round(2) + @grasas_saturadas.round(2)) / 70 * 100).round(2)
  end
  
  def ir_hidratos_carbono
    (@hidratos_de_carbono.round(2) /260 * 100).round(2)
  end
  
  def ir_azucares
    (@azucares.round(2) /90 * 100).round(2)
  end

  def ir_proteinas
    (@proteinas.round(2) / 50 * 100).round(2)
  end
  
  def ir_sal
    (@sal.round(2) / 6 * 100).round(2)
  end
  
  def to_s
    s1 = "Nombre: #{@nombre}\n"
    s2 = "Valor energetico kj: #{@valor_energetico_kj}kj\n"
    s3 = "Valor energetico kcal: #{@valor_energetico_kcal}kcal\n"
    s4 = "Grasas: #{@grasas}g\n"
    s5 = "Grasas saturadas: #{@grasas_saturadas}g\n"
    s6 = "Hidratos de carbono: #{@hidratos_de_carbono}g\n"
    s7 = "Proteinas: #{@proteinas}g\n"
    s8 = "Azucares: #{@azucares}g\n"
    s9 = "Sal: #{@sal}g\n"
    cadena = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8 + s9
    return cadena
  end
  
  def <=>(other)
    # los comentarios locales a los métodos no generan documentación
    return nil unless other.instance_of? Etiqueta
    @valor_energetico_kcal <=> other.obtener_valor_energetico_kcal
  end
  
  def +(other)
    @valor_energetico_kcal + other.obtener_valor_energetico_kcal
  end
end
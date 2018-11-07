class Etiqueta
  
  attr_reader :nombre, :valor_energetico, :grasas, :grasas_saturadas, :hidratos_de_carbono, :azucares, :proteinas, :sal
  
  def initialize(nombre, valor_energetico, grasas, grasas_saturadas, hidratos_de_carbono, azucares, proteinas, sal)
    @nombre = nombre
    @valor_energetico = valor_energetico
    @grasas = grasas
    @grasas_saturadas = grasas_saturadas
    @hidratos_de_carbono = hidratos_de_carbono
    @azucares = azucares
    @proteinas = proteinas
    @sal = sal
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
  
end
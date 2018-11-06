class Etiqueta
  
  attr_reader :valor_energetico, :grasas, :grasas_saturadas, :hidratos_de_carbono, :azucares, :proteinas, :sal
  
  def initialize(valor_energetico, grasas, grasas_saturadas, hidratos_de_carbono, azucares, proteinas, sal)
    @valor_energetico = valor_energetico
    @grasas = grasas
    @grasas_saturadas = grasas_saturadas
    @hidratos_de_carbono = hidratos_de_carbono
    @azucares = azucares
    @proteinas = proteinas
    @sal = sal
  end
  
end
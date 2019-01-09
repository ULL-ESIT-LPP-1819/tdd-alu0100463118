class Menu
  
  include Comparable
  
  attr_accessor :nombre, :ingesta, :platos
  
  def initialize(nombre, &block)
    @nombre = nombre
    @desayuno = []
    @almuerzo = []
    @cena = []
    
    if block_given?  
      instance_eval(&block) 
    end
  end
  
  def titulo(str)
    @title = str
  end
  
  def desayuno(des = {})
    @desayuno << Etiqueta.new(des[:descripcion], des[:grasas], des[:fibra], des[:carbohidratos], 0, des[:proteinas], des[:sal], [des[:porcion], des[:gramos]])
  end
  
  def almuerzo(alm = {})
    @almuerzo << Etiqueta.new(alm[:descripcion], alm[:grasas], alm[:fibra], alm[:carbohidratos], 0, alm[:proteinas], alm[:sal], [alm[:porcion], alm[:gramos]])
  end
  
  def cena(cen = {})
    @cena << Etiqueta.new(cen[:descripcion], cen[:grasas], cen[:fibra], cen[:carbohidratos], 0, cen[:proteinas], cen[:sal], [cen[:porcion], cen[:gramos]])
  end
  
  def ingesta(ing = {})
    @min = ing[:min] if ing[:min]
    @max = ing[:max] if ing[:max]
  end
  
  def kcal
    300#(@desayuno.reduce(:+) + @almuerzo.reduce(:+) + @cena.reduce(:+)).round(2)
  end
  
  def to_s
    output = Tabla.new
    output << @nombre 
    output << '' << 'Grasas' << 'Carbohidratos' << 'Proteinas' << 'Fibra' << 'Sal' << 'Valor energético'
    output << 'Desayuno'
    @desayuno.each do |des|
      output << des.obtener_nombre << des.obtener_grasas.to_s << des.obtener_hidratos_carbono.to_s << des.obtener_proteinas.to_s << des.obtener_grasas_saturadas << des.obtener_sal.to_s << des.obtener_valor_energetico_kcal.round(2).to_s
    end
    output << ''
    output << 'Almuerzo'
    @almuerzo.each do |alm|
      output << alm.obtener_nombre << alm.obtener_grasas.to_s << alm.obtener_hidratos_carbono.to_s << alm.obtener_proteinas.to_s << alm.obtener_grasas_saturadas << alm.obtener_sal.to_s << alm.obtener_valor_energetico_kcal.round(2).to_s
    end
    output << ''
    output << 'Cena'
    @cena.each do |cen|
      output << cen.obtener_nombre << cen.obtener_grasas.to_s << cen.obtener_hidratos_carbono.to_s << cen.obtener_proteinas.to_s << cen.obtener_grasas_saturadas << cen.obtener_sal.to_s << cen.obtener_valor_energetico_kcal.round(2).to_s
    end
    output << ''
    output << 'Valor energético total' << self.kcal
    return output.to_s
  end

end
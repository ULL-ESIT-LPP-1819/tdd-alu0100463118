RSpec.describe EtiquetaNutricional do
  it "has a version number" do
    expect(EtiquetaNutricional::VERSION).not_to be nil
  end

  before(:each) do 
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, [4,40])
  end
  
  it "Debe existir un nombre para la etiqueta" do
    expect(@etiqueta1.obtener_nombre).to eq("nombre")
  end
  
  it "Debe existir la cantidad de grasas" do
    expect(@etiqueta1.obtener_grasas).to eq(10)
  end
  
  it "Debe existir la cantidad de grasas saturadas" do
    expect(@etiqueta1.obtener_grasas_saturadas).to eq(10)
  end

  it "Debe existir la cantidad de hidratos de carbono" do
    expect(@etiqueta1.obtener_hidratos_carbono).to eq(10)
  end
  
  it "Debe existir la cantidad de azucares" do
    expect(@etiqueta1.obtener_azucar).to eq(10)
  end
  
  it "Debe existir la cantidad de proteinas" do
    expect(@etiqueta1.obtener_proteinas).to eq(10)
  end
  
  it "Debe existir la cantidad de sal" do
    expect(@etiqueta1.obtener_sal).to eq(10)
  end
  
  it "Se puede introducir cantidad de porciones y el tamaño de cada una" do
    @etiqueta2 = Etiqueta.new("Etiqueta 2", 10, 10, 10, 10, 10, 10, [4, 2.5])
  end
  
  it "Existe un metodo para obtener el numero de porciones" do
    expect(@etiqueta1.obtener_numero_porciones).to eq(4)
  end
  
  it "Existe un metodo para obtener el valor energetico en Kilojulios" do
    expect(@etiqueta1.obtener_valor_energetico_kj).to eq(1500)
  end
  
  it "Existe un metodo para obtener el valor energetico en Kilocalorias" do
    expect(@etiqueta1.obtener_valor_energetico_kcal).to eq(360)
  end
  
  it "Se calcula el IR del valor energetico" do
    expect(@etiqueta1.ir_valor_energetico_kj).to eq(17.86)
    expect(@etiqueta1.ir_valor_energetico_kcal).to eq(18)
  end
  
  it "Se calcula el IR de la grasa total" do
    expect(@etiqueta1.ir_grasa_total).to eq(28.57)
  end
  
  it "Se calcula el IR de los hidratos de carbono" do
    expect(@etiqueta1.ir_hidratos_carbono).to eq(3.85)
  end
  
  it "Se calcula el IR de los azucares" do
    expect(@etiqueta1.ir_azucares).to eq(11.11)
  end
  
  it "Se calcula el IR de las proteinas" do
    expect(@etiqueta1.ir_proteinas).to eq(20)
  end
  
end

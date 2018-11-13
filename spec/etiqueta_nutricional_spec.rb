RSpec.describe EtiquetaNutricional do
  it "has a version number" do
    expect(EtiquetaNutricional::VERSION).not_to be nil
  end

  before(:each) do 
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, [4,40])
    @etiqueta2 = Etiqueta.new("nombre2", 20, 20, 20, 20, 20, 2, [2,80])
    @etiqueta3 = Etiqueta.new("nombre3", 30, 30, 30, 30, 30, 0, [4,100])
    @etiqueta4 = Etiqueta.new("nombre4", 40, 40, 40, 40, 40, 15, [2,120])
    @etiqueta5 = Etiqueta.new("nombre5", 50, 50, 50, 50, 50, 4, [4,140])
    @etiqueta6 = Etiqueta.new("nombre6", 60, 60, 60, 60, 60, 5, [2,160])
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
  
  it "Se calcula el IR de la sal" do
    expect(@etiqueta1.ir_sal).to eq(166.67)
  end
  
  it "Existe un metodo para mostrar la etiqueta formateada" do
    expect(@etiqueta1).to respond_to(:to_s)
  end
  
  it "La etiqueta se muestra formateada" do
    s1 = "Nombre: nombre\n"
    s2 = "Valor energetico kj: 1500kj\n"
    s3 = "Valor energetico kcal: 360kcal\n"
    s4 = "Grasas: 10g\n"
    s5 = "Grasas saturadas: 10g\n"
    s6 = "Hidratos de carbono: 10g\n"
    s7 = "Proteinas: 10g\n"
    s8 = "Azucares: 10g\n"
    s9 = "Sal: 10g\n"
    expect(@etiqueta1.to_s).to eq(s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8 + s9)
  end
  
  it "Podemos crear nodos con etiquetas" do
    @nodo1 = Nodo.new(@etiqueta1)
  end
  
  it "Existe la clase ListaEtiquetas" do
    @lista1 = ListaEtiquetas.new()
  end
  
  it "Podemos crear una lista con las etiquetas" do
    @lista2 = ListaEtiquetas.new()
    @lista2.pushI(@etiqueta1)
    @lista2.pushI(@etiqueta2)
    @lista2.pushI(@etiqueta3)
  end
  
  it "Podemos ver el primer elemento de la lista" do
    @lista2 = ListaEtiquetas.new()
    @lista2.pushI(@etiqueta1)
    @lista2.pushI(@etiqueta2)
    @lista2.pushI(@etiqueta3)
    expect(@lista2.inicio).to eq(@etiqueta3)
  end
  
  it "Podemos ver el ultimo elemento de la lista" do
    @lista3 = ListaEtiquetas.new()
    @lista3.pushI(@etiqueta1)
    @lista3.pushI(@etiqueta2)
    @lista3.pushI(@etiqueta3)
    expect(@lista3.fin).to eq(@etiqueta1)
  end
  
  it "Podemos insertar un elemento de la lista por el final" do
    @lista4 = ListaEtiquetas.new()
    @lista4.pushF(@etiqueta1)
    @lista4.pushF(@etiqueta2)
    @lista4.pushF(@etiqueta3)
    expect(@lista4.inicio).to eq(@etiqueta1)
  end
  

end

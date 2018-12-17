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
  
end

RSpec.describe ListaEtiquetas do
  
  before(:each) do 
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, [4,40])
    @etiqueta2 = Etiqueta.new("nombre2", 20, 20, 20, 20, 20, 2, [2,80])
    @etiqueta3 = Etiqueta.new("nombre3", 30, 30, 30, 30, 30, 0, [4,100])
    @etiqueta4 = Etiqueta.new("nombre4", 40, 40, 40, 40, 40, 15, [2,120])
    @etiqueta5 = Etiqueta.new("nombre5", 50, 50, 50, 50, 50, 4, [4,140])
    @etiqueta6 = Etiqueta.new("nombre6", 60, 60, 60, 60, 60, 5, [2,160])
  end

  it "Podemos crear nodos con etiquetas" do
    @nodo1 = Nodo.new(@etiqueta1)
  end
  
  it "Existe la clase ListaEtiquetas" do
    @lista1 = ListaEtiquetas.new()
  end
  
  it "Se crea la lista vacia" do
    @lista1 = ListaEtiquetas.new()
    expect(@lista1.inicio).to eq(nil)
  end
  
  it "Podemos crear una lista con las etiquetas" do
    @lista2 = ListaEtiquetas.new()
    @lista2.pushI(@etiqueta1)
    @lista2.pushI(@etiqueta2)
    @lista2.pushI(@etiqueta3)
    expect(@lista2.inicio).not_to eq(nil)
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
  
  it "Podemos eliminar el primer elemento de la lista" do
    @lista5 = ListaEtiquetas.new()
    @lista5.pushF(@etiqueta1)
    @lista5.pushF(@etiqueta2)
    @lista5.pushF(@etiqueta3)
    @lista5.popI
    expect(@lista5.inicio).to eq(@etiqueta2)
  end
  
    it "Podemos eliminar el ultimo elemento de la lista" do
    @lista6 = ListaEtiquetas.new()
    @lista6.pushF(@etiqueta1)
    @lista6.pushF(@etiqueta2)
    @lista6.pushF(@etiqueta3)
    @lista6.popF
    expect(@lista6.fin).to eq(@etiqueta2)
  end
  
  it "Se pueden sumar los gramos de sal" do
    @lista6 = ListaEtiquetas.new()
    @lista6.pushF(@etiqueta1)
    @lista6.pushF(@etiqueta2)
    @lista6.pushF(@etiqueta3)
    @lista6.pushF(@etiqueta4)
    @lista6.pushF(@etiqueta5)
    @lista6.pushF(@etiqueta6)
    expect(@lista6.sal).to eq(36)
  end
  
  it "Clasificacion segun los gramos de sal" do
    @lista7 = ListaEtiquetas.new()
    @lista7.pushF(@etiqueta1)
    @lista7.pushF(@etiqueta2)
    @lista7.pushF(@etiqueta3)
    @lista7.pushF(@etiqueta4)
    @lista7.pushF(@etiqueta5)
    expect(@lista7.clasificacion_sal).to eq("Alta cantidad de sal")
  end
  
  it "Podemos mostrar la lista de etiquetas" do
    @lista8 = ListaEtiquetas.new()
    @lista8.pushF(@etiqueta1)
    @lista8.pushF(@etiqueta2)
    @lista8.pushF(@etiqueta3)
    s1 = "nombre\n"
    s2 = "nombre2\n"
    s3 = "nombre3\n"
    expect(@lista8.to_s).to eq(s1 + s2 + s3)
  end

end

RSpec.describe Individuo do
  
  it "Existe la clase individuo" do
    @individuo1 = Individuo.new("Pepe", 25, 0)
  end
  
  it "Existe la clase paciente" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
  end
  
  it "Paciente es de tipo Paciente" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(@paciente1).to be_an_instance_of(Paciente)
  end
  
  it "Individuo es de la clase Individuo" do
    @individuo1 = Individuo.new("Pepe", 25, 0)
    expect(@individuo1.class).to eq(Individuo)
    
  end
  
  it "Paciente es de la clase Paciente" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(@paciente1.class).to eq(Paciente)
  end
  
  
  it "Paciente es hija de Individuo" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(Paciente.superclass).to eq(Individuo)
  end
  
  it "Paciente esta en la jerarquia de individuo" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(@paciente1.is_a?Object).to eq(true)
  end
  
  it "Individuo es de tipo Individuo" do
    @individuo1 = Individuo.new("Pepe", 25, 0)
    expect(@individuo1).to be_an_instance_of(Individuo)
  end
  
  it "Un paciente es un individuo" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(@paciente1).to be_a_kind_of(Individuo)
  end
  
   it "Paciente responde a metodos de paciente" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    expect(@paciente1.respond_to?(:to_s)).to eq(true)
  end

  it "Podemos crear una lista de individuos" do
    @individuo1 = Individuo.new("Pepe", 25, 0)
    @individuo2 = Individuo.new("Andres", 25, 0)
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    @paciente2 = Paciente.new("Bea", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    @paciente3 = Paciente.new("Sara", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    @lista8 = ListaEtiquetas.new()
    @lista8.pushF(@individuo1)
    @lista8.pushF(@individuo2)
    @lista8.pushF(@paciente1)
    @lista8.pushF(@paciente2)
    @lista8.pushF(@paciente3)
  end
  
  it "Se muestra correctamente los datos de un individuo" do
    @individuo1 = Individuo.new("Pepe", 25, 0)
    s1 = "Nombre: Pepe\n"
    s2 = "Edad: 25\n"
    s3 = "Sexo: Hombre\n"
    expect(@individuo1.to_s).to eq(s1 + s2 + s3)
  end
  
  it "Se muestra correctamente los datos de un paciente" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    s1 = "Nombre: Ana\n"
    s2 = "Edad: 20\n"
    s3 = "Sexo: Mujer\n"
    s4 = "Peso: 75kg\n"
    s5 = "Altura: 1.6m\n"
    s6 = "Circunferencia cintura: [60, 58]cm\n"
    s7 = "Circunferencia cadera: [60, 59]cm\n"
    expect(@paciente1.to_s).to eq(s1 + s2 + s3 + s4 + s5 + s6 + s7)
  end
  
  it "Clasificacion según su indice de masa corporal" do
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    @paciente2 = Paciente.new("Pedro", 22, 0, 80, 1.8, [81, 79], [61, 59], "reposo")
    @paciente3 = Paciente.new("Juan", 30, 0, 110, 1.95, [71, 69], [60, 58], "reposo")
    @paciente4 = Paciente.new("Cristina", 25, 1, 120, 1.55, [55, 56], [50, 50], "reposo")
    @paciente5 = Paciente.new("Bea", 18, 1, 90, 1.72, [45, 45.5], [40, 41], "reposo")
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)
    @lista.pushF(@paciente2)
    @lista.pushF(@paciente3)
    @lista.pushF(@paciente4)
    @lista.pushF(@paciente5)
    expect(@lista.posicion(0).clasificacion_oms).to eq("Sobrepeso")
    expect(@lista.posicion(1).clasificacion_oms).to eq("Adecuado")
    expect(@lista.posicion(2).clasificacion_oms).to eq("Sobrepeso")
    expect(@lista.posicion(3).clasificacion_oms).to eq("Obesidad grado 3")
    expect(@lista.posicion(4).clasificacion_oms).to eq("Obesidad grado 1")
  end
end

RSpec.describe Comparable do
  
  before(:each) do 
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, [4,40])
    @etiqueta2 = Etiqueta.new("nombre2", 20, 20, 20, 20, 20, 2, [2,80])
    @etiqueta3 = Etiqueta.new("nombre3", 30, 30, 30, 30, 30, 0, [4,100])
    @etiqueta4 = Etiqueta.new("nombre4", 40, 40, 40, 40, 40, 15, [2,120])
    @etiqueta5 = Etiqueta.new("nombre5", 50, 50, 50, 50, 50, 4, [4,140])
    @etiqueta6 = Etiqueta.new("nombre6", 60, 60, 60, 60, 60, 10, [2,160])
    @etiqueta7 = Etiqueta.new("nombre7", 10, 10, 10, 10, 10, 10, [4,40])
    
    @individuo1 = Individuo.new("Pepe", 20, 0)
    @individuo2 = Individuo.new("Andres", 30, 0)
    @individuo3 = Individuo.new("Andrea", 25, 0)
    @individuo4 = Individuo.new("John", 25, 0)
    @individuo5 = Individuo.new("Jesus", 27, 0)
    @individuo6 = Individuo.new("Cris", 36, 0)
    
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "reposo")
    @paciente2 = Paciente.new("Pedro", 22, 0, 80, 1.8, [81, 79], [61, 59], "reposo")
    @paciente3 = Paciente.new("Juan", 30, 0, 110, 1.95, [71, 69], [60, 58], "reposo")
    @paciente4 = Paciente.new("Cristina", 25, 1, 90, 1.72, [55, 56], [50, 50], "reposo")
    @paciente5 = Paciente.new("Bea", 18, 1, 90, 1.72, [45, 45.5], [40, 41], "reposo")
  end
  
  it "Pruebas del modulo comparable de las etiquetas" do
    expect(@etiqueta2 > @etiqueta1).to eq(true)
    expect(@etiqueta2 < @etiqueta3).to eq(true)
    expect(@etiqueta1 == @etiqueta7).to eq(true)
    expect(@etiqueta1 <= @etiqueta2).to eq(true)
    expect(@etiqueta6 >= @etiqueta1).to eq(true)
    expect(@etiqueta2.between?(@etiqueta1, @etiqueta4)).to eq(true)
  end
  
  
  it "Pruebas del modulo comparable para los individuos" do
    expect(@individuo1 > @individuo2).to eq(false)
    expect(@individuo3 < @individuo2).to eq(true)
    expect(@individuo4 == @individuo3).to eq(true)
    expect(@individuo1 <= @individuo4).to eq(true)
    expect(@individuo3 >= @individuo6).to eq(false)
    expect(@individuo3.between?(@individuo1, @individuo6)).to eq(true)
  end
  
  it "Pruebas del modulo comparable para los pacientes" do
    expect(@paciente1 > @paciente2).to eq(true)
    expect(@paciente3 < @paciente2).to eq(false)
    expect(@paciente4 == @paciente5).to eq(true)
    expect(@paciente1 <= @paciente5).to eq(true)
    expect(@paciente3 >= @paciente4).to eq(false)
    expect(@paciente1.between?(@paciente2, @paciente4)).to eq(true)
  end
  
  it "Pruebas para comprobar que una lista de etiquetas es enumerable / Metodo sort" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@etiqueta4)
    @lista.pushF(@etiqueta2)
    @lista.pushF(@etiqueta3)
    @lista.pushF(@etiqueta1)
    @lista.pushF(@etiqueta5)
    @lista = @lista.sort
    resultado2 = [@etiqueta1, @etiqueta2, @etiqueta3, @etiqueta4, @etiqueta5]
    expect(@lista).to eq(resultado2)
  end
  
  it "Pruebas para comprobar que una lista de pacientes es enumerable / Metodo sort" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)    #Ana
    @lista.pushF(@paciente2)    #Pedro
    @lista.pushF(@paciente3)    #Juan
    @lista.pushF(@paciente4)    #Cristina
    @lista.pushF(@paciente5)    #Bea
    s1 = "Pedro\n"
    s2 = "Juan\n"
    s3 = "Ana\n"
    s4 = "Cristina\n"
    s5 = "Bea\n"
    @lista = @lista.sort
    cadena = ""
    @lista.each { |a| cadena = cadena + "#{a.obtener_nombre}\n"}
    
    expect(cadena).to eq(s1 + s2 + s3 + s4 + s5)
  end
  
  it "Lista de etiquetas metodo max" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@etiqueta1)
    @lista.pushF(@etiqueta2)
    @lista.pushF(@etiqueta3)
    @lista.pushF(@etiqueta4)
    @lista.pushF(@etiqueta5)
    @maximo = @lista.max
    
    expect(@maximo).to eq(@etiqueta5)
  end
  
  it "Lista de pacientes metodo max" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)
    @lista.pushF(@paciente2)
    @lista.pushF(@paciente3)
    @lista.pushF(@paciente4)
    @lista.pushF(@paciente5)
    @maximo = @lista.max
    
    expect(@maximo).to eq(@paciente4)
  end
  
  it "Lista de etiquetas metodo min" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@etiqueta1)
    @lista.pushF(@etiqueta2)
    @lista.pushF(@etiqueta3)
    @lista.pushF(@etiqueta4)
    @lista.pushF(@etiqueta5)
    @minimo = @lista.min
    
    expect(@minimo).to eq(@etiqueta1)
  end
  
  it "Lista de pacientes metodo min" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)
    @lista.pushF(@paciente2)
    @lista.pushF(@paciente3)
    @lista.pushF(@paciente4)
    @lista.pushF(@paciente5)
    @minimo = @lista.min
    
    expect(@minimo).to eq(@paciente2)
  end
  
  it "Lista de etiquetas metodo collect" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@etiqueta1)
    @lista.pushF(@etiqueta2)
    @lista.pushF(@etiqueta3)
    @lista.pushF(@etiqueta4)
    @lista.pushF(@etiqueta5)
    resultado = @lista.collect {|x| x.obtener_nombre}
    resultado2 = ["nombre", "nombre2", "nombre3", "nombre4", "nombre5"]
    expect(resultado).to eq(resultado2)
  end
  
   it "Lista de pacientes metodo collect" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)
    @lista.pushF(@paciente2)
    @lista.pushF(@paciente3)
    @lista.pushF(@paciente4)
    @lista.pushF(@paciente5)
    resultado = @lista.collect {|x| x.obtener_nombre}
    resultado2 = ["Ana", "Pedro", "Juan", "Cristina", "Bea"]
    expect(resultado).to eq(resultado2)
  end
  
   it "Lista de etiquetas metodo select" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@etiqueta1)
    @lista.pushF(@etiqueta2)
    @lista.pushF(@etiqueta3)
    @lista.pushF(@etiqueta4)
    @lista.pushF(@etiqueta5)
    resultado = @lista.select {|x| x.sal > 8}
    resultado2 = [@etiqueta1, @etiqueta4]
    expect(resultado).to eq(resultado2)
  end
  
  it "Lista de pacientes metodo select" do
    @lista = ListaEtiquetas.new()
    @lista.pushF(@paciente1)
    @lista.pushF(@paciente2)
    @lista.pushF(@paciente3)
    @lista.pushF(@paciente4)
    @lista.pushF(@paciente5)
    resultado = @lista.select {|x| x.imc > 30}
    resultado2 = [@paciente4, @paciente5]
    expect(resultado).to eq(resultado2)
  end
  
end

RSpec.describe ListaEtiquetas do
  
  before(:each) do 
    @etiqueta1 = Etiqueta.new("Lentejas", 7, 7, 7, 7, 7, 7, [4,40])
    @etiqueta2 = Etiqueta.new("Judias", 5, 5, 5, 5, 5, 2, [2,80])
    @etiqueta3 = Etiqueta.new("Solomillo", 30, 30, 30, 30, 30, 0, [4,100])
    @etiqueta4 = Etiqueta.new("Dorada", 40, 40, 40, 40, 40, 15, [2,120])
    @etiqueta5 = Etiqueta.new("Ensalada", 8, 8, 8, 8, 8, 0, [4,140])
    @etiqueta6 = Etiqueta.new("Pera", 60, 60, 60, 60, 60, 10, [2,160])
    @etiqueta7 = Etiqueta.new("Yogurt", 3, 3, 3, 3, 3, 3, [4,40])
    
    @menu1 = ListaEtiquetas.new()
    @menu1.pushF(@etiqueta1)
    @menu1.pushF(@etiqueta2)
    @menu1.pushF(@etiqueta5)
    @menu1.pushF(@etiqueta7)
    
    @menu2 = ListaEtiquetas.new()
    @menu2.pushF(@etiqueta1)
    @menu2.pushF(@etiqueta3)
    @menu2.pushF(@etiqueta4)
    @menu2.pushF(@etiqueta5)
    @menu2.pushF(@etiqueta6)
    
    
    @individuo1 = Individuo.new("Pepe", 20, 0)
    @individuo2 = Individuo.new("Andres", 30, 0)
    @individuo3 = Individuo.new("Andrea", 25, 0)
    @individuo4 = Individuo.new("John", 25, 0)
    @individuo5 = Individuo.new("Jesus", 27, 0)
    @individuo6 = Individuo.new("Cris", 36, 0)
    
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "Actividad moderada")
    @paciente2 = Paciente.new("Pedro", 22, 0, 80, 1.8, [81, 79], [61, 59], "Actividad intensa")
    @paciente3 = Paciente.new("Juan", 30, 0, 110, 1.95, [71, 69], [60, 58], "reposo")
    @paciente4 = Paciente.new("Cristina", 25, 1, 90, 1.72, [55, 56], [50, 50], "reposo")
    @paciente5 = Paciente.new("Bea", 18, 1, 90, 1.72, [45, 45.5], [40, 41], "reposo")
  end
  
  it "La cantidad de la alimentacion debe ser suficiente para cubrir las exigencias caloricas del organismo y mantener el equilibrio de su balance" do
    expect(@paciente1.valoracion(@menu1)).to eq(true)
    expect(@paciente1.valoracion(@menu2)).to eq(true)
    expect(@paciente2.valoracion(@menu1)).to eq(false)
    expect(@paciente2.valoracion(@menu2)).to eq(true)
    expect(@paciente3.valoracion(@menu1)).to eq(false)
    expect(@paciente3.valoracion(@menu2)).to eq(true)
  end
end


RSpec.describe ListaEtiquetas do
  
  before(:each) do 
    @etiqueta1 = Etiqueta.new("Lentejas", 7, 7, 7, 7, 7, 7, [4,40])
    @etiqueta2 = Etiqueta.new("Judias", 5, 5, 5, 5, 5, 2, [2,80])
    @etiqueta3 = Etiqueta.new("Solomillo", 30, 30, 30, 30, 30, 0, [4,100])
    @etiqueta4 = Etiqueta.new("Dorada", 40, 40, 40, 40, 40, 15, [2,120])
    @etiqueta5 = Etiqueta.new("Ensalada", 8, 8, 8, 8, 8, 0, [4,140])
    @etiqueta6 = Etiqueta.new("Pera", 60, 60, 60, 60, 60, 10, [2,160])
    @etiqueta7 = Etiqueta.new("Yogurt", 3, 3, 3, 3, 3, 3, [4,40])
    @etiqueta8 = Etiqueta.new("Chuletas", 8, 8, 8, 8, 8, 0, [2,240])
    @etiqueta9 = Etiqueta.new("Pan", 60, 60, 60, 60, 60, 10, [1,100])
    @etiqueta10 = Etiqueta.new("Tarta", 3, 3, 3, 3, 3, 3, [1,150])
    
    @menu1 = ListaEtiquetas.new()
    @menu1.pushF(@etiqueta1)
    @menu1.pushF(@etiqueta2)
    @menu1.pushF(@etiqueta5)
    @menu1.pushF(@etiqueta7)
    
    @menu2 = ListaEtiquetas.new()
    @menu2.pushF(@etiqueta1)
    @menu2.pushF(@etiqueta3)
    @menu2.pushF(@etiqueta4)
    @menu2.pushF(@etiqueta5)
    @menu2.pushF(@etiqueta6)
    
    @menu3 = ListaEtiquetas.new()
    @menu3.pushF(@etiqueta1)
    @menu3.pushF(@etiqueta3)
    @menu3.pushF(@etiqueta8)
    @menu3.pushF(@etiqueta9)
    
    @menu4 = ListaEtiquetas.new()
    @menu4.pushF(@etiqueta1)
    @menu4.pushF(@etiqueta2)
    @menu4.pushF(@etiqueta4)
    @menu4.pushF(@etiqueta9)
    @menu4.pushF(@etiqueta10)
    
    @menu5 = ListaEtiquetas.new()
    @menu5.pushF(@etiqueta1)
    @menu5.pushF(@etiqueta5)
    @menu5.pushF(@etiqueta6)
    @menu5.pushF(@etiqueta7)
    
    @menu6 = ListaEtiquetas.new()
    @menu6.pushF(@etiqueta1)
    @menu6.pushF(@etiqueta3)
    @menu6.pushF(@etiqueta5)
    @menu6.pushF(@etiqueta7)
    @menu6.pushF(@etiqueta9)
    
    @menu7 = ListaEtiquetas.new()
    @menu7.pushF(@etiqueta1)
    @menu7.pushF(@etiqueta4)
    @menu7.pushF(@etiqueta5)
    @menu7.pushF(@etiqueta6)
    
    @menu8 = ListaEtiquetas.new()
    @menu8.pushF(@etiqueta1)
    @menu8.pushF(@etiqueta2)
    @menu8.pushF(@etiqueta3)
    @menu8.pushF(@etiqueta4)
    @menu8.pushF(@etiqueta6)
  
    @menu9 = ListaEtiquetas.new()
    @menu9.pushF(@etiqueta4)
    @menu9.pushF(@etiqueta5)
    @menu9.pushF(@etiqueta6)
    @menu9.pushF(@etiqueta7)
  
    @menu10 = ListaEtiquetas.new()
    @menu10.pushF(@etiqueta6)
    @menu10.pushF(@etiqueta8)
    @menu10.pushF(@etiqueta9)
    @menu10.pushF(@etiqueta10)
    @menu10.pushF(@etiqueta3)
    
    @menuDietetico = [@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10]
    
    @individuo1 = Individuo.new("Pepe", 20, 0)
    @individuo2 = Individuo.new("Andres", 30, 0)
    @individuo3 = Individuo.new("Andrea", 25, 0)
    @individuo4 = Individuo.new("John", 25, 0)
    @individuo5 = Individuo.new("Jesus", 27, 0)
    @individuo6 = Individuo.new("Cris", 36, 0)
    
    @paciente1 = Paciente.new("Ana", 20, 1, 75, 1.6, [60, 58], [60, 59], "Actividad moderada")
    @paciente2 = Paciente.new("Pedro", 22, 0, 80, 1.8, [81, 79], [61, 59], "Actividad intensa")
    @paciente3 = Paciente.new("Juan", 30, 0, 110, 1.95, [71, 69], [60, 58], "reposo")
    @paciente4 = Paciente.new("Cristina", 25, 1, 90, 1.72, [55, 56], [50, 50], "Actividad ligera")
    @paciente5 = Paciente.new("Bea", 18, 1, 90, 1.72, [45, 45.5], [40, 41], "Actividad moderada")
    @paciente6 = Paciente.new("Pepa", 20, 1, 75, 1.6, [60, 58], [60, 59], "Actividad moderada")
    @paciente7 = Paciente.new("Jose", 22, 0, 80, 1.8, [81, 79], [61, 59], "Actividad intensa")
    @paciente8 = Paciente.new("Jaime", 30, 0, 110, 1.95, [71, 69], [60, 58], "reposo")
    @paciente9 = Paciente.new("Alicia", 25, 1, 90, 1.72, [55, 56], [50, 50], "Actividad ligera")
    @paciente10 = Paciente.new("Carmen", 18, 1, 90, 1.72, [45, 45.5], [40, 41], "Actividad moderada")

    @valoracion1 = ListaEtiquetas.new()
    @valoracion1.pushF(@paciente1)
    @valoracion1.pushF(@paciente2)
    @valoracion1.pushF(@paciente3)
    @valoracion1.pushF(@paciente4)
    @valoracion1.pushF(@paciente5)
    @valoracion1.pushF(@paciente6)
    @valoracion1.pushF(@paciente7)
    @valoracion1.pushF(@paciente8)
    @valoracion1.pushF(@paciente9)
    @valoracion1.pushF(@paciente10)


  end
  
  it "Se puede crear un array de menus" do
    expect(@menuDietetico).to eq([@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10])
  end
  
  it "Se puede crear una lista doblemente enlazada con valoraciones nutricionales" do
    expect(@valoracion1.inicio).to eq(@paciente1)
  end
  
  it "Se puede ordenar un array de menus con un bucle for" do
    @menuDietetico_ordenado = @menuDietetico.ordenar_for
    expect(@menuDietetico_ordenado).to eq([@menu1, @menu5, @menu3, @menu6, @menu9, @menu7, @menu4, @menu8, @menu2, @menu10])
  end
  
  it "Se puede ordenar una lista doblemente enlazada de individuos mediante un bucle for" do
    @valoracion_ordenada = @valoracion1.ordenar_for
    expect(@valoracion_ordenada).to eq([@paciente1, @paciente3, @paciente5, @paciente7, @paciente8, @paciente9, @paciente10, @paciente2, @paciente4, @paciente6])
  end
end
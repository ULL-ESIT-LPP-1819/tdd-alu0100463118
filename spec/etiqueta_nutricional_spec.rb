RSpec.describe EtiquetaNutricional do
  it "has a version number" do
    expect(EtiquetaNutricional::VERSION).not_to be nil
  end

  before(:each) do 
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, 10)
  end
  
  it "Debe existir un nombre para la etiqueta" do
    expect(@etiqueta1.obtener_nombre).to eq("nombre")
  end
  
   it "Debe existir la cantidad de grasas" do
    expect(@etiqueta1.obtener_grasas).to eq(10)
  end

end

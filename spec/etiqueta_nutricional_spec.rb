RSpec.describe EtiquetaNutricional do
  it "has a version number" do
    expect(EtiquetaNutricional::VERSION).not_to be nil
  end

  it "Existe la clase etiqueta nutricional" do
    @etiqueta1 = Etiqueta.new("nombre", 10, 10, 10, 10, 10, 10, 10)
  end
  
  it "Debe existir un nombre para la etiqueta" do
    expect(@etiqueta1.nombre).to eq("nombre")
  end
end

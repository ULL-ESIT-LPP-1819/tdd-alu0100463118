RSpec.describe EtiquetaNutricional do
  it "has a version number" do
    expect(EtiquetaNutricional::VERSION).not_to be nil
  end

  it "Existe la clase etiqueta nutricional" do
    @etiqueta1 = Etiqueta.new()
  end
end

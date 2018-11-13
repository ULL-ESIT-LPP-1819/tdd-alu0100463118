Nodo = Struct.new(:value, :next, :prev)

class ListaEtiquetas
  
  include Enumerable
  
  def initialize()
    @inicio = Nodo.new(nil)
    @fin = Nodo.new(nil)
  end 
  
  def pushI(nodo1)
    nodo = Nodo.new(nodo1, nil, nil)
    if @inicio == nil then
      @inicio = nodo
      @fin = nodo
    else
      nodo.next = @inicio
      @inicio = nodo 
    end
  end
  
  def inicio
    @inicio.value
  end
  
end
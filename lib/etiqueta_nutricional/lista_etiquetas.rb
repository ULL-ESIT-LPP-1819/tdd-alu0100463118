Nodo = Struct.new(:value, :next, :prev)

class ListaEtiquetas
  
  include Enumerable
  
  def initialize()
    @inicio = Nodo.new(nil)
    @fin = Nodo.new(nil)
  end 
  
  def pushI(nodo1)
    nodo = Nodo.new(nodo1, nil, nil)
    if @inicio.value == nil then
      @inicio = nodo
      @fin = nodo
    else
      nodo.next = @inicio
      @inicio.prev = nodo
      @inicio = nodo 
    end
  end
  
  def pushF(nodo1)
    nodo = Nodo.new(nodo1, nil, nil)
    if @inicio.value == nil then
      @inicio = nodo
      @fin = nodo
    else
      nodo.prev = @fin
      @fin.next = nodo
      @fin = nodo
    end
  end
  
  def popI
    @inicio = @inicio.next
  end
  
  def inicio
    @inicio.value
  end
  
  def fin
    @fin.value
  end

end
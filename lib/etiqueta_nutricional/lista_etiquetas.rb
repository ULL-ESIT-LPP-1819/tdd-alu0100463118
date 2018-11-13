Nodo = Struct.new(:value, :next, :prev)

class ListaEtiquetas
  
  include Enumerable
  
  def initialize()
        @inicio = Nodo.new(nil)
        @fin = Nodo.new(nil)
  end 
  
end
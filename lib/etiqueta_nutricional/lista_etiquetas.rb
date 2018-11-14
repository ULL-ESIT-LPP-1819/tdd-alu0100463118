Nodo = Struct.new(:value, :next, :prev)

class ListaEtiquetas
  
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
    @inicio.prev = nil
  end
  
  def popF
    @fin = @fin.prev
    @fin.prev = nil
  end
  
  def inicio
    @inicio.value
  end
  
  def fin
    @fin.value
  end

  def sal
    nodo = @inicio
    suma = 0
    while (nodo != nil)
      suma = suma + nodo.value.obtener_sal
      nodo = nodo.next
    end
    return suma
  end
  
  def clasificacion_sal
    if sal <= 0
      return "Sin sal"
    elsif sal < 10
      return "Baja cantidad de sal"
    elsif sal < 20 
      return "Cantidad moderada de sal"
    else 
      return "Alta cantidad de sal"
    end
  end

end
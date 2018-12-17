Nodo = Struct.new(:value, :next, :prev)

class ListaEtiquetas
  
  include Enumerable
  
  def initialize()
    @inicio = Nodo.new(nil)
    @fin = Nodo.new(nil)
  end 
  
  def each
    nodo = @inicio
    while (nodo != nil)
      yield nodo.value
      nodo = nodo.next
    end
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
  
  def pop(nodo_borrar)
    
    if (@inicio.next == nil)
      @inicio = nil
    else
      if (nodo_borrar == @inicio)
        @inicio = @inicio.next
        @inicio.prev = nil
      else
        nodo = @inicio
        while (nodo != nodo_borrar)
          nodo = nodo.next
        end
        nodo.prev.next = nodo.next
        if (nodo.next != nil)
          nodo.next.prev = nodo.prev
        end
      end
    end
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

  def to_s
    nodo = @inicio
    cadena = ""
    while (nodo != nil)
      cadena = cadena + nodo.value.obtener_nombre + "\n"
      nodo = nodo.next
    end
    return cadena
  end
  
  def posicion(pos)
    nodo = @inicio
    pos.times do
      nodo = nodo.next
    end
    return nodo.value
  end
  
  def pos(po)
    nodo = @inicio
    po.times do
      nodo = nodo.next
    end
    return nodo
  end
  
  def valor_energetico
    calorias_menu = self.reduce(0) { |sum, value| sum + value.obtener_valor_energetico_kcal }
    return calorias_menu
  end
  
  def numero_elementos
    if @inicio == nil
      return 0
    else
      nodo = @inicio
      numero = 0
      while (nodo != nil)
        numero = numero + 1
        nodo = nodo.next
      end
      return numero
    end
  end
  
  def ordenar_for
    @ordenado = self
    @menor
    @revisado = [];
    for i in (0..self.numero_elementos - 1)
      
      @menor = @ordenado.pos(0)
      for j in (0..@ordenado.numero_elementos - 1)
        if (@menor.value.valoracion_nutricional > @ordenado.posicion(j).valoracion_nutricional)
          @menor = @ordenado.pos(j)
        end
      end
      @ordenado.pop(@menor)
      @revisado.push(@menor.value)
    end
    return @revisado
  end
end
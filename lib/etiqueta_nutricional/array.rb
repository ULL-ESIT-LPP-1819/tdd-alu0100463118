class Array
  def ordenar_for
    @ordenado = self
    @menor
    @revisado = [];
    for i in (0..self.length - 1)
      @menor = @ordenado[0]
      for j in (0..@ordenado.length - 1)
        if (@menor.valor_energetico > @ordenado[j].valor_energetico)
          @menor = @ordenado[j]
        end
      end
      @ordenado = @ordenado - [@menor]
      @revisado.push(@menor)
    end
    return @revisado
  end
end
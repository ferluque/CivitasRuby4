# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SorpresaPorCasaHotel < Sorpresa
  def initialize(valor, texto)
    super()
    @valor = valor
    @texto = texto
    
  end
  
  def aplicar_a_jugador (actual, todos)
    if (super.jugador_correcto(actual, todos))
      super.informe(actual, todos)
      todos[actual].modificar_saldo(todos[actual].cantidad_casas_hoteles*valor)
    end
  end
  
  def to_s
    return "SorpresaPorCasaHotel{" + "valor=" + @valor + ", texto=" + @texto + '}'
  end
end

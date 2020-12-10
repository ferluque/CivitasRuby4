# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SorpresaCarcel < Sorpresa
  def initialize (tablero)
    super()
    @tablero = tablero
  end
  
  def aplicar_a_jugador (actual, todos)
    if (super.jugador_correcto(actual, todos))
      super.informe(actual, todos)
      todos[actual].encarcelar(@tablero.num_casilla_carcel)
    end
  end
  
  def to_s
    return "SorpresaCarcel{" + "tablero=" + @tablero.to_s + '}'
  end
end

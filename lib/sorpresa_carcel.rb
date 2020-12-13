# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class SorpresaCarcel < Sorpresa
    def initialize (tablero)
      super(-1, "Ir a la carcel")
      @tablero = tablero
    end
  
    def aplicar_a_jugador (actual, todos)
      if (jugador_correcto(actual, todos))
        informe(actual, todos)
        todos[actual].encarcelar(@tablero.num_casilla_carcel)
      end
    end
  
    def to_s
      return "SorpresaCarcel{" + "tablero=" + @tablero.num_casilla_carcel.to_s + ", "+ super.to_s + '}'
    end
  end
end
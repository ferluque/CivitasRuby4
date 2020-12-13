# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class SorpresaIrCasilla < Sorpresa
    def initialize(tablero, valor, texto)
      super(valor, texto)
      @tablero = tablero
    end
  
    def aplicar_a_jugador(actual, todos)
      if (jugador_correcto(actual, todos))
        informe(actual, todos)
        casilla_actual = todos[actual].num_casilla_actual
        nueva_posicion = @tablero.nueva_posicion(casilla_actual, Dado.instance.tirar)
        todos[actual].mover_a_casilla(nueva_posicion)
      end
    end
  
    def to_s
      return "SorpresairCasilla{" + ", valor=" + valor.to_s + ", texto=" + texto + '}'
    end
  end
end
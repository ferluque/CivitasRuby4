# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class CasillaSorpresa < Casilla
    def initialize (mazo, nombre)
      super(nombre)
      @mazo = mazo
      @sorpresa = nil
    end
  
    def recibe_jugador (actual, todos)
      if (jugador_correcto(actual, todos))
        @sorpresa = @mazo.siguiente
        informe(actual, todos)
        @sorpresa.aplicar_a_jugador(actual, todos)
      end
    end
  
    def to_s
      return "CasillaJuez{"+"nombre=" + nombre + ", sorpresa="+@sorpresa.to_s+", mazo= "+@mazo.to_s+'}'
    end
  end

end
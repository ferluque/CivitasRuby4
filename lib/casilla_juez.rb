# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class CasillaJuez < Casilla
    def initialize(carcel, nombre)
      super(nombre)
      @carcel = carcel
    end
  
    def recibe_jugador (actual, todos)
      if (jugador_correcto(actual, todos))
        informe(actual, todos)
        todos[actual].encarcelar(@carcel)
      end
    end
  
    def to_s
      return "CasillaJuez{" + "nombre="+ nombre + ",carcel=" + @carcel.to_s + '}'
    end
  end
end
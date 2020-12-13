# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class CasillaImpuesto < Casilla
    def initialize (nombre, cantidad)
      super(nombre)
      @importe = cantidad
    end
  
    def recibe_jugador(actual, todos)
      if (super.jugador_correcto(actual, todos))
        super.informe(actual, todos)
        todos[actual].paga_impuesto(@importe)
      end
    end
  
    def to_s
      return "CasillaImpuesto{"+"nombre="+super.nombre+", importe" + @importe.to_s+'}'
    end
  end
end

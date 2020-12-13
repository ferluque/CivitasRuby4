# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class SorpresaPagarCobrar < Sorpresa
    attr_accesor :valor
  
    def initialize(valor, texto)
      super(valor, texto)
    
    end
  
    def aplicar_a_jugador(actual, todos)
      if (jugador_correcto(actual, todos))
        informe(actual, todos)
        todos[actual].modificar_saldo(valor)
      end
    end
  
    def to_s
      return "SorpresaPagarCobrar{"+"valor= " + valor.to_s+ ", texto" + texto+'}'
    end
 
  end

end
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class SorpresaEspeculador < Sorpresa
    def initialize(fianza)
      super("Sorpresa Especulador", fianza)
    end
  
    def aplicar_a_jugador(actual, todos)
      anterior = todos[actual]
      anterior = JugadorEspeculador.nuevo_especulador(anterior, valor)
      todos[actual] = anterior
    end
  
    def to_s
      return "SorpresaEspeculador{" + super+ '}'
    end
  end
end
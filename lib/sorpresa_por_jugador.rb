# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
 
class SorpresaPorJugador < Sorpresa
  def initialize(valor, texto)
    super()
    @valor = valor
    @texto = texto
    
  end
  
  def aplicar_a_jugador (actual, todos)
    if (super.jugador_correcto(actual, todos))
      super.informe(actual, todos)
      pagar = SorpresaPagarCobrar.new(@valor, @texto)
      todos.size.times do |i|
        if (i!=actual)
          pagar.aplicar_a_jugador(i, todos)
        end
      end
      
      cobrar = SorpresaPagarCobrar.new(@valor, @texto)
      cobrar.valor = cobrar.valor*(todos.size-1)
      cobrar.aplicar_a_jugador(actual, todos)
    end
  end
  
  def to_s
    return "SorpresaPorJugador{"+"valor="+@valor.to_s+", texto=" + @texto + '}'
  end
end

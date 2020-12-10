# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SorpresaSalirCarcel < Sorpresa
  def initialize(mazo)
    super
    @mazo = mazo
  end
  
  def aplicar_a_jugador(actual, todos)
    tienen = false
    if (super.jugador_correcto(actual, todos))
      super.informe(actual, todos)
      todos.size.times do |i|
        tienen = todos[i].tiene_salvoconducto
      end
      if (!tienen)
        todos[actual].obtener_salvoconducto(self)
        salir_del_mazo
      end
    end
  end
  
  def salir_del_mazo
    @mazo.inhabilitar_carta_especial(self)
  end
  
  def usada
    @mazo.habilitar_carta_especial(self)
  end
  
  def to_s
    return "SorpresaSalirCarcel{" + "mazo=" + @mazo + '}'
  end
end

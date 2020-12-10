# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CasillaCalle < Casilla
  attr_reader :titulo_propiedad
  
  def initialize (nombre, titulo)
    super(nombre)
    @titulo_propiedad = titulo    
  end
  
  def recibe_jugador (actual, todos) 
    if (super.jugador_correcto(actual, todos))
      super.informe(actual, todos)
      if (!@titulo_propiedad.tiene_propietario)
        todos[actual].puede_comprar_casilla
      else
        @titulo_propiedad.tramitar_alquiler(todos[actual])
      end
    end
  end
  
  def to_s
    return "CasillaCalle{" + "nombre=" + super.nombre + ", titulo_propiedad=" + @titulo_propiedad.to_s + '}'
  end
  
end

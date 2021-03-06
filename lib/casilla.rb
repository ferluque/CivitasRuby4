# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# encoding: UTF-8

module Civitas
  class Casilla
    
    attr_reader :nombre
    
    @@carcel = 10

    def initialize (nombre)
      @nombre = nombre
      
#      @tipo = tipo
#      @titulo_propiedad = titulo
#      @importe = importe
#      @mazo = mazo
#      @sorpresa = nil

    end
    
    
    # A CasillaCarcel

#    def getCarcel
#      return @@carcel
#    end
#    
#    Eliminado este constructor (Es el de la clase padre)
#    def self.new_descanso (name)
#      new(name, Civitas::Tipo_casilla::DESCANSO, nil, nil)      
#    end
#    A casillaCalle
#    def self.new_calle (titulo)
#      new(titulo.nombre, Civitas::Tipo_casilla::CALLE, titulo, nil)
#    end
#    
#    A CasillaImpuesto
#    def self.new_impuesto(cantidad, name)
#      new(name, Civitas::Tipo_casilla::IMPUESTO, nil, nil, cantidad)
#    end
#     
#    A CasillaJuez
#    def self.new_juez(num_casilla_carcel, name)
#      @@carcel = num_casilla_carcel
#      new(name, Civitas::Tipo_casilla::JUEZ, nil, nil)
#    end
#    
#    A CasillaSorpresa
#    def self.new_sorpresa(mazo, name)
#      new(name, Civitas::Tipo_casilla::SORPRESA, nil, mazo)
#    end
    
    private
    def informe (actual, todos)
      Diario.instance.ocurre_evento("El jugador "+todos[actual].nombre+" ha caido en la casilla "+ nombre)
    end
    
    public
    def jugador_correcto(actual, todos)
      return (actual>=0 && actual<todos.size())
    end
    
    def recibe_jugador (actual, todos)
#      Se deja solo el informe
#      case @tipo
#      when Civitas::Tipo_casilla::CALLE
#        recibe_jugador_calle(actual, todos)
#      when Civitas::Tipo_casilla::IMPUESTO
#        recibe_jugador_impuesto(actual,todos)
#      when Civitas::Tipo_casilla::JUEZ
#        recibe_jugador_juez(actual, todos)
#      when Civitas::Tipo_casilla::SORPRESA
#        recibe_jugador_sopresa(actual, todos)
#      end
      informe(actual, todos)
    end
    
    
#    A CasillaCalle
#    private
#    def recibe_jugador_calle (actual, todos)
#      if (jugador_correcto(actual, todos))
#        informe(actual, todos)
#        if (!@titulo_propiedad.tiene_propietario)
#          todos[actual].puede_comprar_casilla
#        else
#          @titulo_propiedad.tramitar_alquiler(todos[actual])
#        end
#      end
#    end
#    
#    A CasillaImpuesto
#    def recibe_jugador_impuesto (actual, todos)
#      if (jugador_correcto(actual, todos))
#        informe(actual, todos)
#        todos[actual].paga_impuesto(@importe)
#      end
#    end
#    
#    A CasillaJuez
#    def recibe_jugador_juez (actual, todos)
#      if (jugador_correcto(actual, todos))
#        informe(actual, todos)
#        todos[actual].encarcelar(@@carcel)
#      end
#    end
#    
#    A CasillaSorpresa
#    def recibe_jugador_sopresa(actual, todos)
#      if (jugador_correcto(actual, todos))
#        sorpresa = @mazo.siguiente
#        informe(actual, todos)
#        sorpresa.aplicar_a_jugador(actual, todos)
#      end
#    end
    
    public
    def to_s
      devolver = "Casilla{nombre=" + @nombre + '}'
      return devolver
    end
      
#    /*
#    def self.prueba
#      descanso = Casilla.new_descanso("Descanso")
#      puts descanso.to_s
#      
#      calle = Casilla.new_calle(TituloPropiedad.new("Gran Via", 150.0, 1.2,200.0,250.0,50.0))
#      puts calle.to_s
#      
#      impuesto = Casilla.new_impuesto(100.0, "Impuesto de luz")
#      puts impuesto.to_s
#      
#      juez = Casilla.new_juez(10, "Carcel")
#      puts juez.to_s
#      
#      sorpresa = Casilla.new_sorpresa(MazoSorpresas.new(), "Casilla Sorpresa")
#      puts sorpresa.to_s
#    end
#    */
  end
  
end

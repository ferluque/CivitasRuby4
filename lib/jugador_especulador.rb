# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class JugadorEspeculador < Jugador
  
    @@factor_especulador = 2
  
    def initialize(fianza)
      @fianza = fianza
    end
    
    def self.nuevo_especulador(jugador, fianza)
      especulador = new(fianza)
      puts "El error esta en constr_copia"
      especulador.constr_copia(jugador)
      puts "Sale de constr_copia"
      especulador.propiedades.size.times do |i|
        especulador.propiedades[i].actualiza_propietario_por_conversion(self)      
      end
      return especulador
    end
    
    private_class_method :new
    
    def encarcelar (num_casilla_carcel)
      if (tiene_salvoconducto)
        return false
      end
      if (puedo_gastar(@fianza))
        paga(@fianza)
        return false
      end
      super.encarcelar(num_casilla_carcel)
      return true
    end
    
    def paga_impuesto (cantidad)
      if (encarcelado)
        return false
      else
        return paga(cantidad/2)
      end
    end
    
    private_class_method
    def self.get_casas_max
      return casas_max*@@factor_especulador
    end
    
    def self.get_hoteles_max
      return hoteles_max*@@factor_especulador
    end
    
    public
    def construir_casa(ip)
      result = false
      
      if (encarcelado)
        return result
      else
        existe = existe_la_propiedad(ip)
      end
      if (existe)
        propiedad = propiedades[ip]
        if (puedo_edificar_casa(propiedad))
          result = propiedad.construir_casa(self)
          if (result)
            Diario.instance.ocurre_evento("El jugador "+nombre+" construye una casa en la propiedad " + ip.to_s)
          end
        end      
      end
      return result
    end
    
    def construir_hotel(ip)
      result = false
      if (encarcelado)
        return result
      end
      if (existe_la_propiedad(ip))
        propiedad = propiedades[ip]
        if (puedo_edificar_hotel(propiedad))
          result = propiedad.construir_hotel(self)
          propiedad.derruir_casas(casas_por_hotel, self)
          if (result)
            Diario.instance.ocurre_evento("El jugador " + nombre + " construye un hotel en la propiedad "+ ip.to_s)
          end
        end
      end
      return result
    end
    
    private
    def puedo_edificar_casa(propiedad)
      return (puedo_gastar(propiedad.precio_edificar)&& (propiedad.num_casas < get_casas_max))
    end
    
    def puedo_edificar_hotel(propiedad)
      return(puedo_gastar(propiedad.precio_edificar) && (propiedad.num_hoteles < get_hoteles_max))
    end
    
    public
    def to_s
      return "JugadorEspeculador{factor_especulador= " + @@factor_especulador.to_s + ", Jugador= "+super+ '}'
    end
  end
end
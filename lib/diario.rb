# encoding: UTF-8

require 'singleton'
module Civitas
  class Diario
    include Singleton

    private
    def initialize
      @eventos = []
    end

    public
    def ocurre_evento(e)
      @eventos << e
    end

    def eventos_pendientes
      return (@eventos.length > 0)
    end

    def leer_evento
      e = @eventos.shift
      return e
    end

  end
end

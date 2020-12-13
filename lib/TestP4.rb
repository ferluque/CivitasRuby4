# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "casilla.rb"
require_relative "civitas_juego"
require_relative "controlador"
require_relative "dado"
require_relative "diario"
require_relative "estados_juego"
require_relative "gestiones_inmobiliarias"
require_relative "gestor_estados"
require_relative "jugador"
require_relative "mazo_sorpresas"
require_relative "operacion_inmobiliaria"
require_relative "operaciones_juego"
require_relative "respuestas"
require_relative "salidas_carcel"
require_relative "sorpresa"
require_relative "tablero"
require_relative "titulo_propiedad"
require_relative "vista_textual"
require_relative "sorpresa_especulador"
require_relative "jugador_especulador"

module Civitas

  jugador = Jugador.new("Fernando")
  convertir = SorpresaEspeculador.new(100)

  propiedad = TituloPropiedad.new("ABC", 8.0, 1.1, 35.0, 50.0, 10.0)
  jugador.propiedades.push(propiedad)

  puts jugador.to_s

  todos = [jugador]

  convertir.aplicar_a_jugador(0, todos)

  puts todos[0].to_s

end
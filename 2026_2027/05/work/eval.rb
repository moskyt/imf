require_relative "lib/zke"

zke = ZKE.new("../../04/data/mcnp/many_outputs")

zke.read

zke.print_2d
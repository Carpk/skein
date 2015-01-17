module MapConfig

  Map = {
          vermillion: {name: "Vermillion Room", north: "wall", east: :ochre, south: :aquamarine, west: "wall"},
          ochre: {name: "Ochre Room", north: :vermillion, east: :chartreuse , south: :ochre, west: "wall"},
          chartreuse: {name: "Chartreuse Room", north: :ochre, east: "wall", south: :emerald , west: "wall"},
          emerald: {name: "Emerald Room", north: "wall", east: :lavender, south: :aquamarine, west: :cobalt},
          aquamarine: {name: "Aquamarine Room", north: "wall", east: "wall", south: :violet, west: :cobalt},
          lavender: {name: "Lavender Room", north: "wall", east: :chartreuse, south: "wall", west: :burnt_sienna},
          cobalt: {name: "Cobalt Room", north: :vermillion, east: "wall", south: :burnt_sienna, west: :vermillion},
          violet: {name: "Violet Room", north: "wall", east: :burnt_sienna, south: :burnt_sienna, west: :chartreuse},
          burnt_sienna: {name: "Burnt Sienna Room", north: :emerald, east: :lavender, south: "wall", west: "wall"}
        }
end
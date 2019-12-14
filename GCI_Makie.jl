using Makie
 
 t = Node(0)

 
 c = lift(t) do t
         RGBf0(0, (255 - t)/255, t/255)
     end

scene  = scatter(rand(10), rand(10), rand(10), color = c, visible = true, glowcolor = :red, glowwidth = 3, alpha = 0.5, backgroundcolor = :black)
sc_t = title(scene, "Animated Scatter Plot", color = :white, align = (:center, :center), textsize = 25, backgroundcolor = :black, font = :Consolas)
scene[Axis].names.textcolor = :gray

record(sc_t, "output.mp4", 1:1275; framerate = 30) do i
     t[] = (i % 255) + 1 
end


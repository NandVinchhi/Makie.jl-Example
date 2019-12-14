using Makie
 
#time variable
 t = Node(0)
 
#changing color of plots using animation "output.mp4"
 c = lift(t) do t
         RGBf0(0, (255 - t)/255, t/255)
     end

#scene
scene  = scatter(rand(10), rand(10), rand(10), color = c, visible = true, glowcolor = :red, glowwidth = 3, alpha = 0.5, backgroundcolor = :black)
#title
sc_t = title(scene, "Animated Scatter Plot", color = :white, align = (:center, :center), textsize = 25, backgroundcolor = :black, font = :Consolas)
scene[Axis].names.textcolor = :gray # changing color of axis so that it is visible on black background.

#output.mp4
record(sc_t, "output.mp4", 1:1275; framerate = 30) do i
     t[] = (i % 255) + 1 
end


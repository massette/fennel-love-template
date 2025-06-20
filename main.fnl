; main.fnl
(local g love.graphics)

(local fnt (g.newFont))
(local label "Edit main.fnl !!")

; love callbacks
(fn love.draw []
  (let [cx (/ (- (g.getWidth) (fnt:getWidth label)) 2)
        cy (/ (- (g.getHeight) (fnt:getHeight)) 2)]
    (g.print label cx cy)))

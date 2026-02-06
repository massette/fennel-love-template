; main.fnl
(local g love.graphics)

(local ui (require "lib.ui"))

(local menu
  (doto (ui.panel {:anchor    :top
                   :direction :vertical})
        (: :add
           (doto (ui.label "Start")
                 (tset :on-click)))))

(fn love.keypressed [keycode]
  )

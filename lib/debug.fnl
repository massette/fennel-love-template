(fn repr [value ?level]
  (let [level (or ?level 0)
              indent (string.rep "  " level)]
    (case (type value)
      :table (.. (accumulate [result "{\n"
                              key value (pairs value)]
                   (.. result indent "  ["
                       (repr key (+ level 1))
                       "] = "
                       (repr value (+ level 1))
                       ",\n"))
                 indent "}")
      :string (.. "'" value "'")
      _ value)))

(fn print-repr [tbl]
  (print (repr tbl)))

{: repr
 :print print-repr}

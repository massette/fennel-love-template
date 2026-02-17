(fn indent [str]
  (let [TABFILL "    "
        (result _) (str:gsub "(\r?\n)" (.. "%1" TABFILL))]
    (.. TABFILL result)))

(fn repr [value ?depth]
  (let [depth  (- (or ?depth inf) 1)]
    (case (type value)
      :table (if
               (= (next value) nil) "{}"
               (<= depth 0) "{ ... }"
               (.. "{\n"
                   (-> (icollect [key value (pairs value)]
                         (.. "[" (repr key depth) "] = " (repr value depth) ","))
                       (table.concat "\n")
                       (indent))
                   "\n}"))
      :string (.. "'" value "'")
      _ (.. "(" (tostring value) ")"))))

(fn print-repr [value]
  (print (repr value)))

{: repr
 :print print-repr}

(defsystem :sqlite
  :name "sqlite"
  :author "Kalyanov Dmitry <Kalyanov.Dmitry@gmail.com>"
  :maintainer "Jacek Złydach <cl-sqlite@jacek.zlydach.pl>"
  :description "CL-SQLITE package is an interface to the SQLite embedded relational database engine."
  :homepage "https://common-lisp.net/project/cl-sqlite/"
  :source-control (:git "git@github.com:TeMPOraL/cl-sqlite.git")
  :bug-tracker "https://github.com/TeMPOraL/cl-sqlite/issues"
  :version "0.2.1"
  :license "Public Domain"

  :components ((:file "sqlite-ffi")
               (:file "cache")
               (:file "sqlite" :depends-on ("sqlite-ffi" "cache")))

  :depends-on (:iterate :cffi :sqlite/config)

  :in-order-to ((test-op (load-op sqlite-tests))))

(defsystem :sqlite/config
  :name "sqlite/config")
  :author "Tom Rake <zzzap1957@gmail.com>"
  :description "A external library configuration based on the cl+ssh config idiom."
  :version "0.0.1"
  :license "Public Domain"
  :components ((:file config))
  :depends-on (:cffi)
(defmethod perform ((o asdf:test-op) (c (eql (find-system :sqlite))))
  (funcall (intern "RUN-ALL-SQLITE-TESTS" :sqlite-tests)))

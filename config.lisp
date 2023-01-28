(defpackage :sqlite/config
  (:use
   #:cl)
  (:export
   #:define-sqlite-lib))
(in-package :sqlite/config)

(defvar *sqlite-lib-override* nil)

(defmacro define-sqlite-lib (path)
    "Define the path  where sqlite-lib resides to PATH (not evaluated). This
macro should be used before loading SQLITE.

For instance, this defines lib-sqlite as \"c:/msys64/mingw64/bin/libsqlite3-0.dll\":
   (ql:quicklload :sqlite/config)
   (sqlite/config:define-sqlite-lib \"c:/msys64/mingw64/bin/libsqlite3-0.dll\")
   (ql:quickload :sqlite)"
  
  `(progn
     (cffi:define-foreign-library sqlite3-lib (t ,path))
     (setq *sqlite-lib-override* t)))

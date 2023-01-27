(defpackage :sqlite/config
  (:use
   #:cl)
  (:export
   #:define-sqlite3-lib))
(in-package :sqlite/config)

(defvar *sqlite3-lib-override* nil)

(defmacro define-sqlite3-lib (path)
    "Define the path  where sqlite-lib resides to PATH (not evaluated). This
macro should be used before loading SQLITE.

For instance, this defines lib-sqlite as \"c:/msys64/mingw64/bin/libsqlite3-0.dll\":
   (ql:quicklload :sqlite/config)
   (sqlite/config:define-sqlite3-lib \"c:/msys64/mingw64/bin/libsqlite3-0.dll\")
   (ql:quickload :sqlite)"
  
  `(progn
     (cffi:define-foreign-library sqlite-lib3 (t ,path))
     (setq *sqlite3-lib-override* t)))

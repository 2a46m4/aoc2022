(defun pt1 ()
  (with-temp-buffer
	(insert-file-contents "input.txt")
	(let (a (split-string (buffer-string) "\n" t)))
	(message "%S" a)
	))

(pt1)

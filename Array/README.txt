
We also provide macros AO_REAL_HEAD_PTR that converts an AO_stack_t
to a pointer to the link field in the next element, and AO_REAL_NEXT_PTR
that converts a link field to a real, dereferencable, pointer to the link field
in the next element.  This is intended only for debugging, or to traverse
the list after modification has ceased.  There is otherwise no guarantee that
walking a stack using this macro will produce any kind of consistent
picture of the data structure.

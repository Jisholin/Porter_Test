CALL public.addemployee(
	<IN firstname character varying>,
	<IN lastname  character varying>,
	<IN departmentid  integer>
) values ()

CALL public.addemployee('Justin','K',16)

exec public.addemployee


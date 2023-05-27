CREATE OR REPLACE PROCEDURE Crear_Puesto(puesto_id in number, puesto_nombre in varchar, result out boolean)  AS
BEGIN
    insert into Puesto values (puesto_id, puesto_nombre);
    commit;
    result:= TRUE;
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLCODE||' '||SQLERRM);
        rollback;
        result:= FALSE;
END;
/


CREATE OR REPLACE PROCEDURE Seleccionar_Puesto(puesto_id in number, puesto_nombre out varchar)  AS
BEGIN
    select p.nombre into puesto_nombre from Puesto p where p.id = puesto_id;
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLCODE||' '||SQLERRM);
END;
/


CREATE OR REPLACE PROCEDURE Actualizar_Puesto(puesto_id in number, puesto_nombre in varchar, result out boolean)  AS
BEGIN
    update Puesto set nombre = puesto_nombre where id = puesto_id;
    commit;
    result:= TRUE;
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLCODE||' '||SQLERRM);
        rollback;
        result:= FALSE;
END;
/


CREATE OR REPLACE PROCEDURE Eliminar_Puesto(puesto_id in number, result out boolean)  AS
BEGIN
    delete from Puesto where id = puesto_id;
    commit;
    result:= TRUE;
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Error: '||SQLCODE||' '||SQLERRM);
        rollback;
        result:= FALSE;
END;
/
# modelo.py
from config import obtener_conexion

class UsuarioModel:

    @staticmethod
    def crear_usuario(documento,correo,apellido,nombre,tipoDocumento,telefono,estado,rol):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO usuario (usuDocumento,usuCorreo,usuApellido,usuNombre,usuTipoDocumento,usuTelefono,usuEstado,rolId_fk) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
        cursor.execute(sql, (documento,correo,apellido,nombre,tipoDocumento,telefono,estado,rol))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_usuarios():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM usuario")
        usuarios = cursor.fetchall()
        conexion.close()
        return usuarios

    @staticmethod
    def actualizar_usuario(documento,correo,apellido,nombre,tipoDocumento,telefono,estado,rol):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE usuario SET usuCorreo = %s, usuApellido = %s, usuNombre = %s, usuTipoDocumento = %s, usuTelefono = %s, usuEstado = %s, rolId_fk = %s WHERE usuDocumento = %s"
        cursor.execute(sql, (correo,apellido,nombre,tipoDocumento,telefono,estado,rol,documento))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_usuario(iddocumento):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM usuario WHERE usuDocumento = %s"
        cursor.execute(sql, (iddocumento,))
        conexion.commit()
        conexion.close()
#############################################################################################
class MateriaModel:

    @staticmethod
    def crear_materia(descripcion, profesor,estado):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO materia (matDescripcion, profIdProfesor,matEstado) VALUES (%s,%s,%s)"
        cursor.execute(sql, (descripcion, profesor,estado))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_materias():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM materia")
        materias = cursor.fetchall()
        conexion.close()
        return materias

    @staticmethod
    def actualizar_materia(idmateria, descripcion, profesor,estado):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE materia SET matDescripcion = %s, profIdProfesor = %s, matEstado = %s WHERE matId = %s"
        cursor.execute(sql, (descripcion, profesor,estado, idmateria))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_materia(idmateria):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM materia WHERE matId = %s"
        cursor.execute(sql, (idmateria,))
        conexion.commit()
        conexion.close()
#############################################################################################
class CursoModel:

    @staticmethod
    def crear_curso(descripcion,estado,profesor,estudiante):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO curso (cursoDescripcion, cursoEstado,profId_fk,estuId_fk) VALUES (%s,%s,%s,%s)"
        cursor.execute(sql, (descripcion,estado,profesor,estudiante))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_cursos():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM curso")
        cursos = cursor.fetchall()
        conexion.close()
        return cursos

    @staticmethod
    def actualizar_curso(idcurso, descripcion,estado,profesor,estudiante):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE curso SET cursoDescripcion = %s,cursoEstado = %s,profId_fk = %s,estuId_fk = %s WHERE cursoId = %s"
        cursor.execute(sql, (descripcion,estado,profesor,estudiante, idcurso))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_curso(idcurso):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM curso WHERE cursoId = %s"
        cursor.execute(sql, (idcurso,))
        conexion.commit()
        conexion.close()
#############################################################################################
class ProfesorModel:

    @staticmethod
    def crear_profesor(documento,estudios):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO profesor (usuDocumento_fk, profEstudios) VALUES (%s,%s)"
        cursor.execute(sql, (documento,estudios))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_profesor():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM profesor")
        profesores = cursor.fetchall()
        conexion.close()
        return profesores

    @staticmethod
    def actualizar_profesor(idprofesor,documento,estudios):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE profesor SET usuDocumento_fk = %s, profEstudios = %s WHERE profId = %s"
        cursor.execute(sql, (documento,estudios, idprofesor))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_profesor(idprofesor):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM profesor WHERE profId = %s"
        cursor.execute(sql, (idprofesor,))
        conexion.commit()
        conexion.close()
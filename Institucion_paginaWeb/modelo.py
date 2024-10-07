# modelo.py
from config import obtener_conexion

class UsuarioModel:
    @staticmethod
    def documento_existe(documento):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "SELECT COUNT(*) FROM usuario WHERE usuDocumento = %s"
        cursor.execute(sql, (documento,))
        existe = cursor.fetchone()[0] > 0
        conexion.close()
        return existe

    @staticmethod
    def crear_usuario(documento, correo, apellido, nombre, tipoDocumento, telefono, estado, rol):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO usuario (usuDocumento, usuCorreo, usuApellido, usuNombre, usuTipoDocumento, usuTelefono, usuEstado, rolId_fk) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, (documento, correo, apellido, nombre, tipoDocumento, telefono, estado, rol))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_usuarios():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_usuario")
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
        sql = "INSERT INTO materia (matDescripcion, profIdProfesor_fk,matEstado) VALUES (%s,%s,%s)"
        cursor.execute(sql, (descripcion, profesor,estado))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_materias():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_nombre_profesor")
        materias = cursor.fetchall()
        conexion.close()
        return materias
    
    @staticmethod
    def obtener_profesores():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = """
        SELECT profesor.profId, usuario.usuNombre, usuario.usuApellido 
        FROM profesor 
        JOIN usuario ON profesor.usuDocumento_fk = usuario.usuDocumento
        """
        cursor.execute(sql)
        profesores = cursor.fetchall()
        conexion.close()
        return profesores

    @staticmethod
    def actualizar_materia(idmateria, descripcion, profesor,estado):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE materia SET matDescripcion = %s, profIdProfesor_fk = %s, matEstado = %s WHERE matId = %s"
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
    def crear_curso(descripcion,estado,profesor):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO curso (cursoDescripcion, cursoEstado,profId_fk) VALUES (%s,%s,%s)"
        cursor.execute(sql, (descripcion,estado,profesor))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_cursos():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_curso")
        cursos = cursor.fetchall()
        conexion.close()
        return cursos
    
    @staticmethod
    def obtener_profesores():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = """
        SELECT profesor.profId, usuario.usuNombre, usuario.usuApellido 
        FROM profesor 
        JOIN usuario ON profesor.usuDocumento_fk = usuario.usuDocumento
        """
        cursor.execute(sql)
        profesores = cursor.fetchall()
        conexion.close()
        return profesores

    @staticmethod
    def actualizar_curso(idcurso, descripcion,estado,profesor):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE curso SET cursoDescripcion = %s,cursoEstado = %s,profId_fk = %s WHERE cursoId = %s"
        cursor.execute(sql, (descripcion,estado,profesor, idcurso))
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
    def obtener_profesor():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_profesor")
        profesores = cursor.fetchall()
        conexion.close()
        return profesores

    @staticmethod
    def actualizar_profesor(idprofesor,estudios):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE profesor SET profEstudios = %s WHERE profId = %s"
        cursor.execute(sql, (estudios, idprofesor))
        conexion.commit()
        conexion.close()

#############################################################################################
class EstudianteModel:

    @staticmethod
    def obtener_estudiante():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_estudiante")
        estudiantes = cursor.fetchall()
        conexion.close()
        return estudiantes
    
    @staticmethod
    def actualizar_estudiante(idestudiante,curso):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE estudiante SET cursoId_fk = %s WHERE estuId = %s"
        cursor.execute(sql, (curso, idestudiante))
        conexion.commit()
        conexion.close()

    @staticmethod
    def obtener_cursos():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT cursoId, cursoDescripcion FROM curso")
        cursos = cursor.fetchall()
        conexion.close()
        return cursos
#############################################################################################

class AdministrativoModel:

    @staticmethod
    def obtener_administrativo():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM vista_administrativos")
        administrativos = cursor.fetchall()
        conexion.close()
        return administrativos

    @staticmethod
    def actualizar_administrativo(idadministrativo,cargo):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE administrativo SET adminCargo = %s WHERE adminId = %s"
        cursor.execute(sql, (cargo, idadministrativo))
        conexion.commit()
        conexion.close()